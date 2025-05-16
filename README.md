Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# Projet DBT - Examen Snowflake (Données musicales)

Ce projet DBT vise à modéliser, interroger et analyser un entrepôt de données musicale à partir de fichiers CSV chargés depuis un bucket S3 dans Snowflake.

## Objectif

Migrer, structurer et exploiter des données musicales via une modélisation en étoile, à l’aide de DBT connecté à Snowflake, et produire des vues SQL pour répondre à 11 questions d’analyse.

## Structure du projet

demo_dbt/
├── models/
│   ├── example/
│   └── models/
│       ├── exam/           # Contient les 11 requêtes de l'examen
│       ├── schema.yml      # Déclaration des sources Snowflake
├── macros/
├── seeds/
├── snapshots/
├── tests/
├── dbt_project.yml
└── README.md

## Technologies utilisées

- DBT (Data Build Tool)
- Snowflake (entreposage de données)
- VSCode (développement)
- Git / GitHub (versioning)

## Connexion Snowflake (dans `.dbt/profiles.yml`)

```yaml
demo_dbt:
  outputs:
    dev:
      type: snowflake
      account: <ton_account>
      user: <ton_user>
      password: <ton_mot_de_passe>
      role: ACCOUNTADMIN
      database: MUSIC_WH
      schema: MUSIC_SCHEMA
      warehouse: COMPUTE_WH
      threads: 1
  target: dev

Déclaration des sources dans schema.yml

Les tables Snowflake importées depuis s3://course-snowflakes/sample/music/ sont déclarées comme sources :

sources:
  - name: music
    database: MUSIC_WH
    schema: MUSIC_SCHEMA
    tables:
      - name: album
      - name: artist
      - name: genre
      - name: track
      - name: playlist
      - name: playlisttrack
      - name: mediatype

Exécution du projet

    Compiler toutes les vues liées à l’examen :

dbt run --select tag:examen

    Compiler une vue spécifique :

dbt run --select nom_du_modele

Requêtes traitées

    Titres des albums avec plus d'un CD

    Morceaux produits en 2000 ou 2002

    Morceaux de Rock et Jazz avec compositeurs

    Top 10 albums les plus longs

    Nombre d'albums par artiste

    Nombre de morceaux par artiste

    Genre le plus écouté dans les années 2000

    Playlists avec morceaux de plus de 4 minutes

    Morceaux Rock d’artistes français

    Moyenne des tailles de morceaux par genre

    Playlists avec artistes nés avant 1990

Auteur
Benoist Légal
Projet réalisé dans le cadre d’un exercice d’évaluation Snowflake + DBT.
Développé sous environnement Ubuntu avec Visual Studio Code.