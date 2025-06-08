# 🌎 Global Solutions - 2025 - 1º Semestre
## 💧 +Água Containers: Solução para Gestão de Recursos Hídricos
---
## 📋 Visão Geral

O projeto **+Água** é uma solução de monitoramento inteligente de reservatórios para prevenção de eventos extremos como enchentes e secas. Esta documentação detalha a infraestrutura DevOps implementada para suportar o desenvolvimento, teste e implantação do sistema.

## 🏗️ Arquitetura da Solução

O sistema é composto por dois componentes principais:

1. **API REST em Java/Spring Boot** - Backend que gerencia os dados dos reservatórios, dispositivos e leituras
2. **Banco de Dados Oracle** - Armazenamento persistente para os dados do sistema

## 🐳 Containerização

### Aplicação Java

```dockerfile
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /app
RUN groupadd --system aguaGroup && useradd --system --gid aguaGroup prismaUser
RUN chown -R prismaUser:aguaGroup /app
USER prismaUser
COPY --from=build /app/target/mais_agua-0.0.1-SNAPSHOT.jar .
ENV JAVA_APP_PROFILE=production
EXPOSE 8080
CMD ["java", "-jar", "mais_agua-0.0.1-SNAPSHOT.jar"]
```

### Banco de Dados Oracle

Um container separado é configurado para o banco de dados Oracle, com scripts de inicialização que configuram o esquema necessário para a aplicação.

## 🚀 Pipeline de Implantação

O processo de implantação segue estas etapas:

1. **Build**: Compilação do código Java usando Maven
2. **Test**: Execução de testes automatizados
3. **Package**: Empacotamento da aplicação em um JAR
4. **Containerize**: Criação da imagem Docker
5. **Deploy**: Implantação dos containers

## 📊 Monitoramento e Observabilidade

A aplicação está configurada com:

- Logs estruturados usando SLF4J
- Métricas de desempenho expostas via API
- Agendamentos automatizados para geração de dados de leitura (`@Scheduled`)

## 🛠️ Scripts de Automação

### entrypoint.sh
Script que inicializa o banco de dados e executa os scripts SQL necessários:
- Criação do modelo físico
- Inserção de dados iniciais

### java-dockerRun.sh / bd-dockerRun.sh
Scripts para facilitar a execução dos containers Docker para a aplicação Java e o banco de dados.

## 🔄 Fluxo de Dados Automático

A solução inclui jobs automatizados que rodam diariamente:

1. Às 9:00 - `HistoricoReservatorioService.gerarHistoricoDiario()` - Gera históricos de níveis dos reservatórios
2. Às 9:10 - `LeituraDispositivoService.gerarLeitura()` - Gera leituras simuladas de dispositivos com dados de nível, turbidez e pH

## 🔒 Segurança

- Containers executados com usuários não-root
- Configuração de JWT para autenticação de API
- Separação de ambientes via variáveis de ambiente

## 🚦 Como Executar a Solução

1. Clone o repositório
2. Execute o banco de dados:
   ```
   ./bd-dockerRun.sh
   ```
3. Execute a aplicação Java:
   ```
   ./java-dockerRun.sh
   ```
4. Acesse a API em http://localhost:8080
5. Consulte a documentação Swagger em http://localhost:8080/swagger-ui/index.html

## 👥 Equipe

- **Laura de Oliveira Cintra** - RM558843
- **Maria Eduarda Alves da Paixão** - RM558832
- **Vinicius Saes de Souza** - RM554456

## 🔗 Links

- API Documentation (Swagger)
- [GitHub Repository](https://github.com/yourusername/DevOps-GlobalSolutions-2025)
