# Use uma imagem base com Ruby
FROM ruby:3.0.2

# Instale dependências
RUN apt-get update -qq && apt-get install -y postgresql-client nodejs npm

# Instale o bundler
RUN gem install bundler

# Defina o diretório de trabalho
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para o container
COPY Gemfile Gemfile.lock ./

# Instale as dependências
RUN bundle install

# Copie todo o código do backend para o container
COPY . .

# Exponha a porta que o servidor Rails usará
EXPOSE 3000

# Inicie o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]