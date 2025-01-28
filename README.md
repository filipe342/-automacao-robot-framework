# README - Projeto de Automação de Testes com Robot Framework

## 📌 Descrição do Projeto
Este projeto tem como objetivo automatizar os testes do **frontend** e **backend (API)** da aplicação [Serverest](https://serverest.dev/).  

A automação inclui:  
👉 **Testes End-to-End (E2E)** na interface web utilizando **SeleniumLibrary**  
👉 **Testes de API** com **RequestsLibrary**  
👉 **Execução e relatórios automatizados**  

---
## 🛠️ Tecnologias Utilizadas
- 🚀 **[Robot Framework](https://robotframework.org/)** - Framework de automação de testes  
- 🌐 **SeleniumLibrary** - Para automação de testes Web/UI  
- 🔐 **RequestsLibrary** - Para automação de testes API  
- 🎭 **FakerLibrary** - Para geração de dados dinâmicos  
- 🐍 **Python** - Linguagem base do projeto  

---
## 📚 Estrutura do Projeto
```plaintext
📺 Desafio de Automacão com Robot Framework
 └💻 .venv                # Ambiente virtual Python
 └📄 reports              # Relatórios gerados após execução
 └📚 resources            # Recursos do projeto
   └📒 keywords           # Palavras-chave reutilizáveis
     └📝 frontend_keywords.robot  # Keywords para testes do frontend
     └📝 api_keywords.robot       # Keywords para testes de API
   └📒 variables          # Variáveis globais do projeto
     └📝 global_variables.robot  # Configurações gerais e variáveis
 └📚 tests                # Casos de teste
   └📒 frontend           # Testes automatizados para o frontend
     └📝 test_cadastro.robot     # Teste de cadastro
     └📝 test_login.robot        # Teste de login
     └📝 test_cadastro_usuario_logado.robot  # Cadastro logado
   └📒 api               # Testes automatizados para a API
     └📝 test_login_api.robot        # Teste de login via API
     └📝 test_produtos_api.robot     # Teste de produtos via API
     └📝 test_listar_produto.robot   # Teste de listagem de produtos
 └📝 README.md            # Documentação do projeto
 └📝 requirements.txt      # Dependências do projeto
 └📝 .gitignore            # Arquivos ignorados no Git
```

---
## 💻 Configuração do Ambiente

### 1️⃣ Criando e Ativando o Virtual Environment (venv)
**Windows (PowerShell)**
```powershell
python -m venv .venv
.\.venv\Scripts\Activate
```
**Linux/macOS**
```bash
python3 -m venv .venv
source .venv/bin/activate
```

---
### 2️⃣ Instalando as Dependências
```bash
pip install -r requirements.txt
```
Caso precise gerar o arquivo `requirements.txt`, utilize:
```bash
pip freeze > requirements.txt
```

---
### 3️⃣ Executando os Testes

**Rodar todos os testes do Frontend**  
```bash
robot tests/frontend/
```
**Rodar todos os testes de API**  
```bash
robot tests/api/
```
**Executar um teste específico**  
```bash
robot tests/frontend/test_login.robot
```
**Gerar relatório detalhado**  
```bash
robot --outputdir reports tests/
```
Relatórios gerados em `reports/`:  
📌 `output.xml` - Saída dos testes  
📌 `log.html` - Log detalhado  
📌 `report.html` - Relatório de execução  

---
## 👀 Testes Implementados
### **Frontend**
- **Cadastro de Usuário**  
- **Login**  
- **Cadastro de Usuário Logado**  

### **API**
- **Cadastro de Usuário** (`POST /usuarios`)
- **Login** (`POST /login`)
- **Cadastro de Produtos** (`POST /produtos`)
- **Listagem de Produtos** (`GET /produtos`)

---
## 💡 Dicas Úteis

**Rodar os testes em modo DEBUG**
```bash
robot --loglevel TRACE tests/
```
**Rodar testes em paralelo**
```bash
pabot --processes 2 --outputdir reports tests/
```
**Gerar logs mais detalhados**
```bash
robot --loglevel DEBUG --outputdir reports tests/
```

---
## 🚀 Melhorias Futuras
- Implementação de testes paralelos  
- Geração automática de dados  
- Integração com CI/CD  
- Testes cross-browser  

---
## 📩 Contato
Dúvidas ou sugestões? Entre em contato!  
💎 Email: contato@example.com  

---
🚀 **Automatização bem-feita melhora a qualidade e confiabilidade dos sistemas!** 💡