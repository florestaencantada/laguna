# Laguna

Uma plataforma aberta para construir e operar um lakehouse “AI‑powered”, com interface gráfica, controle de acesso e uma stack de infraestrutura híbrida (on‑premises e AWS).

## Sobre o Projeto

Toda a infraestrutura da floresta se baseia em uma grande plataforma de dados que faz tudo funcionar com harmonia — mas, no fim, usamos as mesmas tecnologias que vocês humanos usam. Para tornar essa plataforma acessível e reproduzível, nasceu o projeto Laguna (o lago da floresta). A ideia é oferecer uma interface gráfica, controle de acesso e uma stack de infraestrutura híbrida on‑premises e AWS, permitindo que qualquer pessoa suba sua própria infraestrutura de lakehouse orientada por IA.

Na prática, o Laguna propõe:
- Provisionamento de infraestrutura híbrida (on‑premises e AWS) via IaC
- Lakehouse com camadas de dados, catálogo e governança
- Orquestração de pipelines de dados e ML (execução em grafo/DAG)
- Interface Web com controle de acesso (RBAC)
- Conectores e ferramentas para ingestão, transformação e integração
- Integração com modelos de IA para enriquecer pipelines (classificação, sumarização, QA/RAG, automações)

O objetivo é oferecer uma base simples e pragmática, poderosa o suficiente para cenários reais e extensível para conectar seus próprios provedores, armazenamento, catálogos, ferramentas e modelos.

## Recursos e Tecnologias

Laguna é desenhado com tecnologias e conceitos amplamente utilizados:

- Infraestrutura como código: Terraform e Ansible
- Cloud e on‑prem: AWS e alternativas compatíveis (ex.: S3/MinIO)
- Linguagem principal e SDKs: Python
- Orquestração em grafo/DAG para pipelines de dados e ML
- UI Web: React para a camada de interface
- IA/ML: PyTorch e provedores de LLM (APIs compatíveis com OpenAI)
- Ferramentas e conectores: HTTP, sistema de arquivos, fontes de dados e serviços externos
- Gerenciamento de dependências e tarefas: uv (package manager) e Make (alvos para setup, build, testes e validações)
- Configuração: variáveis de ambiente para credenciais e parâmetros de execução

Observação: o conjunto exato de integrações é flexível, permitindo escolher provedores, armazenamento, catálogo e ferramentas que melhor se adaptem ao seu ambiente.

## Configurações e uso

### Pré-requisitos:
- Python 3.12+
- Git
- uv (gerenciador de pacotes/ambientes). Instalação e docs: https://docs.astral.sh/uv/
- Windows Subsystem for Linux (WSL) - Windows 10,11
- Credenciais de provedores (cloud/LLM) conforme os recursos que você pretende usar

### Passos:
1) Clonar o repositório
   - git clone https://github.com/florestaencantada/laguna.git
   - cd laguna

2) Sincronizar dependências e preparar o ambiente virtual automaticamente com o uv
   - make setup

3) Executar testes e validações automatizadas
   - make test

4) Rodar a CLI
   - uv run laguna --version

5) Atualizar dependências
   - make sync

