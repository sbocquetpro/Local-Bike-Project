# Local Bike - Projet DBT

Ce projet a été réalisé dans le cadre de ma formation chez **Data Bird**. L'objectif était de manipuler et de modéliser des données d'une entreprise fictive nommée **Local Bike**, à partir de fichiers CSV fournis. Le but final était de créer des dashboards self-service sur **Metabase** en s'appuyant sur une architecture de modélisation en médaillon.

## Objectifs du projet

- **Nettoyage et transformation des données brutes** provenant de plusieurs fichiers CSV.
- **Modélisation des données** en utilisant **DBT** (Data Build Tool) selon l'architecture en médaillon :
  - **Staging** : Nettoyage, normalisation et standardisation des données brutes afin d'assurer la cohérence et la qualité des informations.
  - **Intermediate** : Modélisation des données intermédiaires permettant d'effectuer des calculs, des agrégations et des transformations avancées.
  - **Mart** : Agrégation des données prêtes à être consommées par des outils de BI, facilitant la création de rapports et d'analyses précis.
- **Création de dashboards interactifs** et self-service sur Metabase pour permettre aux utilisateurs finaux d'explorer les données de manière autonome et d'obtenir des insights pertinents.

## Stack technique

- **DBT** : pour la transformation et la modélisation des données.
- **Metabase** : pour la visualisation et l'analyse des données grâce à des interfaces intuitives et personnalisables.
- **Git** : pour le versionnage du code et la collaboration en équipe.
- **SQL** : pour l'interrogation des données et la réalisation de transformations avancées.

## Résultats

- **Amélioration de la qualité des données** grâce à des processus de nettoyage rigoureux, rendant les analyses plus fiables.
- **Mise en place d'une architecture de données claire et scalable**, facilitant la maintenance et l'évolution du projet.
- **Création de plusieurs dashboards interactifs** pour le suivi des performances de l'entreprise Local Bike, avec des indicateurs clés tels que :
  - Le suivi des ventes par période
  - L'analyse des comportements d'achat des clients.
  - Le suivi des stocks et de la gestion des inventaires.
  - La performance des différents points de vente.

## Défis rencontrés

- Gestion des **valeurs manquantes** et des **anomalies** dans les données brutes.
- Optimisation des performances des requêtes SQL pour réduire les temps de calcul.
- Conception de modèles de données adaptés aux besoins variés des utilisateurs finaux.


## Dashboards
![Dashboard](https://github.com/sbocquetpro/Local-Bike-Project/blob/main/Dashboard_LocalBike_1.png)

![Dashboard](https://github.com/sbocquetpro/Local-Bike-Project/blob/main/Dashboard_LocalBike_2.png)

![Dashboard](https://github.com/sbocquetpro/Local-Bike-Project/blob/main/Dashboard_LocalBike_3.png)



