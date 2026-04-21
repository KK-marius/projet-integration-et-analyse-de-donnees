# Catalogue de données – Couche Gold

## Vue d’ensemble
La couche Gold représente les données au niveau métier, structurées pour répondre aux besoins d’analyse et de reporting. Elle est composée de **tables de dimensions** et de **tables de faits** dédiées à des indicateurs métiers spécifiques.

---

### 1. **gold.dim_customers**
- **Objectif :** Stocke les informations clients enrichies avec des données démographiques et géographiques.
- **Colonnes :**

| Nom de la colonne | Type de données| Description                                                                                                |
|-------------------|----------------|------------------------------------------------------------------------------------------------------------|
| customer_key      | INT            | Clé de substitution identifiant de manière unique chaque enregistrement client dans la table de dimension. |
| customer_id       | INT            | Identifiant numérique unique attribué à chaque client.                                                     |
| customer_number   | NVARCHAR(50)   | Identifiant alphanumérique représentant le client, utilisé pour le suivi et les références.                |
| first_name        | NVARCHAR(50)   | Prénom du client tel qu’enregistré dans le système.                                                        |
| last_name         | NVARCHAR(50)   | Nom de famille du client.                                                                                  |
| country           | NVARCHAR(50)   | Pays de résidence du client (ex : "France").                                                               |
| marital_status    | NVARCHAR(50)   | Statut matrimonial du client (ex : "Marié", "Célibataire").                                                |
| gender            | NVARCHAR(50)   | Genre du client (ex : "Homme", "Femme", "n/a").                                                            |
| birthdate         | DATE           | Date de naissance du client, au format YYYY-MM-DD (ex : 1971-10-06).                                       |
| create_date       | DATE           | Date de création de l’enregistrement client dans le système.                                               |

---

### 2. **gold.dim_products**
- **Objectif :** Fournit des informations sur les produits et leurs attributs.
- **Colonnes :**

| Nom de la colonne    | Type de données|Description                                                                                                     |
|----------------------|----------------|----------------------------------------------------------------------------------------------------------------|
| product_key          | INT            | Clé de substitution identifiant de manière unique chaque produit dans la table de dimension.                   |
| product_id           | INT            | Identifiant unique attribué au produit pour le suivi interne.                                                  |
| product_number       | NVARCHAR(50)   | Code alphanumérique structuré représentant le produit, utilisé pour la catégorisation ou la gestion des stocks.|
| product_name         | NVARCHAR(50)   | Nom descriptif du produit incluant des informations comme le type, la couleur et la taille.                    |
| category_id          | NVARCHAR(50)   | Identifiant unique de la catégorie du produit, permettant son rattachement à une classification globale.       |
| category             | NVARCHAR(50)   | Catégorie générale du produit (ex : Bikes, Components).                                                        |
| subcategory          | NVARCHAR(50)   | Sous-catégorie du produit, plus détaillée que la catégorie principale.                                         |
| maintenance_required | NVARCHAR(50)   | Indique si le produit nécessite une maintenance (ex : "Oui", "Non").                                           |
| cost                 | INT            | Coût ou prix de base du produit, exprimé en unités monétaires.                                                 |
| product_line         | NVARCHAR(50)   | Ligne ou gamme de produits (ex : Road, Mountain).                                                              |
| start_date           | DATE           | Date de mise à disposition du produit pour la vente ou l’utilisation.                                          |

---

### 3. **gold.fact_sales**
- **Objectif :** Stocke les données transactionnelles de ventes à des fins analytiques.
- **Colonnes :**

| Nom de la colonne | Type de données| Description                                                                      |
|-------------------|----------------|----------------------------------------------------------------------------------|
| order_number      | NVARCHAR(50)   | Identifiant alphanumérique unique de la commande (ex : "SO54496").               |
| product_key       | INT            | Clé de substitution reliant la commande à la table de dimension des produits.    |
| customer_key      | INT            | Clé de substitution reliant la commande à la table de dimension des clients.     |
| order_date        | DATE           | Date de création de la commande.                                                 |
| shipping_date     | DATE           | Date d’expédition de la commande.                                                |
| due_date          | DATE           | Date limite de paiement de la commande.                                          |
| sales_amount      | INT            | Montant total de la vente pour la ligne, en unités monétaires entières (ex : 25).|
| quantity          | INT            | Quantité de produits commandés pour la ligne (ex : 1).                           |
| price             | INT            | Prix unitaire du produit pour la ligne, en unités monétaires entières (ex : 25). |