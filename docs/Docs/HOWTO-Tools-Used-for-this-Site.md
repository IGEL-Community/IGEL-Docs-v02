# HOWTO Tools Used for this Site

-----

## Background

The following is used for the creation of this site:

- **GitHub:** Used to hold the files, GitHub action to automate the building of the `html` files, and serving of the `html` files.

- **MkDocs:** MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file.

- **Material for MKDocs:** Material is the theme used with MkDocs.

-----

## GitHub Location

- GitHub Location: [https://github.com/IGEL-Community/IGEL-Docs-v02](https://github.com/IGEL-Community/IGEL-Docs-v02)

-----

## MkDocs YAML file

- File Location: `mkdocs.yml`

```yaml linenums="1"
site_name: IGEL Community Docs
theme:
  name: material
  features:
    - navigation.tabs
    - navigation.sections
    - toc.integrate
    - navigation.top
    - search.suggest
    - search.highlight
    - content.tabs.link
    - content.code.annotation
    - content.code.copy
  language: en
  palette:
    - scheme: default
      toggle:
        icon: material/toggle-switch-off-outline 
        name: Switch to dark mode
      primary: teal
      accent: purple 
    - scheme: slate 
      toggle:
        icon: material/toggle-switch
        name: Switch to light mode    
      primary: teal
      accent: lime

markdown_extensions:
  - pymdownx.critic
  - pymdownx.caret
  - pymdownx.keys
  - pymdownx.mark
  - pymdownx.tilde
  - def_list
  - pymdownx.tasklist:
      custom_checkbox: true
  - attr_list
  - pymdownx.emoji:
      emoji_index: !!python/name:materialx.emoji.twemoji
      emoji_generator: !!python/name:materialx.emoji.to_svg
  - pymdownx.tasklist:
      custom_checkbox: true
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format

```

-----

## GitHub Action Automation

- File Location: `.github/workflows/ci.yml`

```yaml linenums="1"
name: ci 
on:
  push:
    branches:
      - master 
      - main
permissions:
  contents: write
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-python@v4
        with:
          python-version: 3.x
      - uses: actions/cache@v2
        with:
          key: ${{ github.ref }}
          path: .cache
      - run: pip install mkdocs-material 
      - run: mkdocs gh-deploy --force
```

-----

## GitHub Pages

- Location: `Settings > Pages`

- Build and deployment Source: `Deploy from a branch`

- Branch: `gh-pages` `/(root)`

- Site Location: [https://igel-community.github.io/IGEL-Docs-v02/](https://igel-community.github.io/IGEL-Docs-v02/)

**NOTE:** Created a tinyurl short cut of [https://tinyurl.com/igel-docs](https://tinyurl.com/igel-docs)
