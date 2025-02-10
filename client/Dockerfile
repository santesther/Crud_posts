# Use uma imagem base com Node.js
FROM node:20

# Defina o diretório de trabalho
WORKDIR /app

# Copie o package.json e package-lock.json para o container
COPY package.json package-lock.json ./

# Instale as dependências
RUN npm install

# Copie todo o código do frontend para o container
COPY . .

# Exponha a porta do Vite
EXPOSE 5173

# Inicie o Vite
CMD ["npm", "run", "dev"]