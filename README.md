# Nvoip Homebrew Tap

[![CI](https://github.com/Nvoip/homebrew-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/Nvoip/homebrew-tap/actions/workflows/ci.yml) [![Homebrew](https://img.shields.io/badge/Homebrew-Nvoip%2Ftap-FBB040?style=flat-square)](https://github.com/Nvoip/homebrew-tap) [![Nvoip](https://img.shields.io/badge/Nvoip-site-00A3E0?style=flat-square)](https://www.nvoip.com.br/)

Homebrew tap oficial da [Nvoip](https://www.nvoip.com.br/) para instalar integrações de linha de comando com a API v3.

## Instalação

```bash
brew tap Nvoip/tap
brew install nvoip-shell
```

## Pacotes

- `nvoip-shell`: scripts Linux/macOS para OAuth, saldo, SMS, chamadas, OTP e WhatsApp.

## Links oficiais

- [Site da Nvoip](https://www.nvoip.com.br/)
- [Documentação da API](https://github.com/Nvoip/nvoip-api-v3/blob/main/docs/openapi/README.md)
- [Hub de exemplos](https://github.com/Nvoip/nvoip-api-examples)

## Migração para a v3

A URL base é `https://api.nvoip.com.br/v3`. Emita o token no backend em `https://api.nvoip.com.br/auth/oauth2/token`, com formulário `grant_type=client_credentials`, `client_id` e `client_secret`, e use `Authorization: Bearer`. O token do usuário e a napikey antigos não autenticam a v3. `client_credentials` pode não emitir refresh token; renove pela mesma emissão quando expirar. A chave com escopos depende do NN-5543 e não é apresentada como disponível aqui.

[Guia de migração v2 → v3](https://github.com/Nvoip/nvoip-api-examples/blob/main/docs/migration-v2-v3.md).
