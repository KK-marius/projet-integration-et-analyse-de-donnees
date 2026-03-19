# Projet d'intégration et d’analyse de données

Ce projet présente une solution complète d'intégration et d’analyse de données, allant de la construction d’un data warehouse à la génération d’insights exploitables.
Il met en avant les bonnes pratiques en data engineering, en modélisation des données et en analytique.

---

## Exigences du projet

### Construction du Data Warehouse

#### Objectif
Développer un data warehouse moderne avec SQL Server afin de centraliser les données de vente, permettant le reporting analytique et la prise de décision éclairée.

#### Spécifications
- **Sources de données** : Importer les données provenant de deux systèmes sources (ERP et CRM) fournis sous forme de fichiers CSV.
- **Qualité des données** : Nettoyer les données et résoudre les problèmes de qualité avant l’analyse.
- **Intégration** : Combiner les deux sources en un modèle de données unique, intuitif et optimisé pour les requêtes analytiques.
- **Périmètre** : Se concentrer uniquement sur les données les plus récentes ; l’historisation n’est pas requise.
- **Documentation** : Fournir une documentation claire du modèle de données afin de faciliter son utilisation par les parties prenantes métier et les équipes analytiques.

---

## Architecture des données

L’architecture des données de ce projet repose sur une architecture en médaillon (*Medallion Architecture*) avec trois couches : **Bronze**, **Silver** et **Gold**.

1. **Couche Bronze** : Stocke les données brutes telles qu’elles proviennent des systèmes sources. Les données sont ingérées depuis des fichiers CSV vers la base de données SQL Server.

2. **Couche Silver** : Cette couche comprend les processus de nettoyage, de standardisation et de normalisation des données afin de les préparer pour l’analyse.

3. **Couche Gold** : Contient des données prêtes à l’usage métier, modélisées sous forme de schéma en étoile (*star schema*), adaptées au reporting et à l’analyse.

---

### BI : Analyse & Reporting

#### Objectif
Développer des analyses basées sur SQL afin de produire des insights détaillés sur :

- **Le comportement des clients**
- **La performance des produits**
- **Les tendances de vente**

Ces analyses permettent aux parties prenantes d’accéder à des indicateurs clés, facilitant ainsi la prise de décisions stratégiques.

---

## Structure du dépôt
```
projet-integration-et-analyse-de-donnees/
│
├── datasets/                           # Jeux de données bruts utilisés pour le projet
│
├── docs/                               # Documentation du projet et détails de l’architecture
│   ├── etl.drawio                      # Les différentes techniques et méthodes ETL
│   ├── data_architecture.drawio        # Architecture du projet
│   ├── data_catalog.md                 # Catalogue des données (descriptions des champs et métadonnées)
│   ├── data_flow.drawio                # Diagramme des flux de données
│   ├── data_models.drawio              # Modèles de données (schéma en étoile)
│   ├── naming-conventions.md           # Règles de nommage pour les tables, colonnes et fichiers
│
├── scripts/                            # Scripts SQL pour les processus ETL et les transformations
│   ├── bronze/                         # Extraction et chargement des données brutes
│   ├── silver/                         # Nettoyage et transformation des données
│   ├── gold/                           # Création des modèles analytiques
│
├── tests/                              # Scripts de test et fichiers de validation qualité
│
├── README.md                           # Présentation du projet et instructions
├── LICENSE                             # Informations sur la licence
├── .gitignore                          # Fichiers et dossiers ignorés par Git
└── requirements.txt                    # Dépendances du projet
```
---

## Licence

Ce projet est sous licence [MIT License](LICENSE). Vous êtes libre d’utiliser, de modifier et de partager ce projet, à condition d’en mentionner la source.

---
