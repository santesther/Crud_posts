# Use uma imagem base leve com Ruby
FROM ruby:3.0.2-slim

# Instale dependências básicas
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instale o bundler
RUN gem install bundler

# Defina o diretório de trabalho
WORKDIR /app

# Copie apenas os arquivos necessários pro bundle
COPY Gemfile Gemfile.lock ./

# Instale as gems somente de produção (ou customize)
ENV BUNDLE_WITHOUT="development test"
RUN bundle install

# Agora copie o resto da aplicação
COPY . .

# Exponha a porta
EXPOSE 3000

# Comando padrão
CMD ["rails", "server", "-b", "0.0.0.0"]
