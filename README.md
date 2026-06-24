# Dom Património - Frontend

Este é o repositório de frontend para o sistema **Dom Património**, uma Single Page Application (SPA) moderna, rápida e responsiva para a gestão e acompanhamento de ativos e património.

## Tecnologias Utilizadas

- **HTML5 & Vanilla JavaScript** (ES6+)
- **Tailwind CSS** (via CDN com configurações personalizadas)
- **Chart.js** (para visualizações gráficas de ativos e depreciação)
- **Lucide Icons** (para ícones modernos e consistentes)
- **Supabase SDK v2** (para integração e banco de dados em tempo real)

## Como Correr o Projeto no Browser

Por se tratar de uma Single Page Application (SPA) estática, existem duas formas simples de correr o projeto localmente:

### Método 1: Abertura Direta
Pode simplesmente abrir o ficheiro `index.html` diretamente no seu navegador de internet preferido (double-click ou arrastar para o browser).

### Método 2: Servidor Local (Recomendado)
Para uma experiência mais próxima de produção e para evitar problemas de CORS ou restrições de segurança do protocolo `file://`, recomenda-se a utilização de um servidor web local super leve.

#### Utilizando o Python:
Se tiver o Python instalado, corra o seguinte comando no terminal dentro deste diretório:
```bash
python -m http.server 8000
```
Em seguida, abra o seu browser em [http://localhost:8000](http://localhost:8000).

#### Utilizando o Node.js (`live-server` / `serve`):
Se preferir o ecossistema Node.js:
```bash
npx serve .
```
Ou utilizando `live-server`:
```bash
npx live-server
```
