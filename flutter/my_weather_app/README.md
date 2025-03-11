# 🌦️ Aplicação de Clima - Flutter + FastAPI

Este projeto é um aplicativo **Flutter** que consome uma API **FastAPI** para exibir a previsão do tempo de uma cidade. O app carrega por padrão a previsão para **Madrid**, mas permite buscar o clima de outras cidades.

## 📂 Estrutura do Projeto
```
projeto_flutter/
│── lib/
│   │── main.dart            # Tela principal do app
│   │── weather_service.dart # Requisição HTTP para a API
│   │── weather_model.dart   # Modelo de dados do clima
│── pubspec.yaml             # Dependências do Flutter
│── android/                 # Código Android
│── ios/                     # Código iOS
│── web/                     # Código Web
│── README.md                # Documentação
```

---

## 🚀 Como Rodar o Projeto

### 🔹 1. Configurar o Backend FastAPI
Antes de rodar o Flutter, **certifique-se de que o backend FastAPI está rodando**.

1. Acesse o diretório do backend e ative o ambiente virtual:
   ```bash
   cd caminho/do/backend
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate  # Windows
   ```

2. Inicie o backend:
   ```bash
   uvicorn app.main:app --reload
   ```
   O backend rodará em: `http://127.0.0.1:8000`

### 🔹 2. Instalar o Flutter no Windows
Caso não tenha o Flutter instalado, siga as instruções:
- **Baixar e instalar**: [Guia de Instalação](https://docs.flutter.dev/get-started/install)
- Verificar a instalação:
  ```bash
  flutter doctor
  ```

### 🔹 3. Configurar e Rodar o App Flutter
1. Acesse o diretório do projeto Flutter:
   ```bash
   cd caminho/do/flutter_app
   ```
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Rode o aplicativo no navegador (Chrome):
   ```bash
   flutter run -d chrome
   ```
   Para rodar no Android:
   ```bash
   flutter run -d android
   ```

---

## 🔄 Funcionalidades
✅ Exibe a previsão do tempo de qualquer cidade.  
✅ Interface moderna e responsiva.  
✅ Fundo com gradiente azul e UI profissional.  
✅ Campo de busca estilizado e botão animado.  
✅ Mensagem de erro ao inserir uma cidade inválida.  
✅ Suporte para Web, Android e iOS.

---

## 🔗 API FastAPI

O aplicativo se conecta à API FastAPI que fornece dados do clima. A API responde a chamadas GET:

| Método | Endpoint         | Parâmetro       | Descrição |
|--------|----------------|----------------|-------------|
| `GET`  | `/weather`     | `?city=Paris` | Obtém o clima de uma cidade |

Exemplo de requisição:
```bash
curl "http://127.0.0.1:8000/weather?city=Madrid"
```

Resposta esperada:
```json
{
  "location": {"name": "Madrid", "country": "Spain"},
  "current": {"temperature": 10, "weather_descriptions": ["Soleado"]}
}
```

---

## 📌 Notas Finais
✅ **O backend FastAPI precisa estar rodando para o app funcionar**.  
✅ **Se a cidade for inválida, o app exibe uma mensagem ao invés de limpar a tela**.  
✅ **O app aceita pressionar "Enter" para buscar a cidade**.  

🎉 **Agora você pode rodar o app e visualizar a previsão do tempo!** 🌤️

