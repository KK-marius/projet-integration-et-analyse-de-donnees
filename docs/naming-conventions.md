# **Conventions de nommage**

Ce document décrit les conventions de nommage utilisées pour les schémas, tables, vues, colonnes et autres objets du data warehouse.

## **Table des matières**

1. [Principes généraux](#principes-generaux)
2. [Conventions de nommage des tables](#conventions-de-nommage-des-tables)
   - [Règles Bronze](#regles-bronze)
   - [Règles Silver](#regles-silver)
   - [Règles Gold](#regles-gold)
3. [Conventions de nommage des colonnes](#conventions-de-nommage-des-colonnes)
   - [Clés substitutives](#cles-substitutives)
   - [Colonnes techniques](#colonnes-techniques)
4. [Procédures stockées](#procedures-stockees)
---

## **Principes généraux**

- **Convention de nommage** : Utiliser le format *snake_case*, avec des lettres minuscules et des underscores (`_`) pour séparer les mots.
- **Langue** : Utiliser l’anglais pour tous les noms.
- **Mots réservés** : Ne pas utiliser les mots réservés SQL comme noms d’objets.

---

## **Conventions de nommage des tables**

### **Règles Bronze**
- Tous les noms doivent commencer par le nom du système source, et les noms des tables doivent correspondre exactement à ceux du système source, sans modification.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>` : Nom du système source (ex : `crm`, `erp`).  
  - `<entity>` : Nom exact de la table dans le système source.  
  - Exemple : `crm_customer_info` → Informations clients provenant du système CRM.

---

### **Règles Silver**
- Tous les noms doivent commencer par le nom du système source, et les noms des tables doivent correspondre exactement à ceux du système source, sans modification.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>` : Nom du système source (ex : `crm`, `erp`).  
  - `<entity>` : Nom exact de la table dans le système source.  
  - Exemple : `crm_customer_info` → Informations clients provenant du système CRM.

---

### **Règles Gold**
- Tous les noms doivent être explicites et alignés avec le métier, en utilisant un préfixe de catégorie.
- **`<category>_<entity>`**  
  - `<category>` : Rôle de la table (ex : `dim` pour dimension, `fact` pour table de faits).  
  - `<entity>` : Nom descriptif aligné avec le domaine métier (ex : `customers`, `products`, `sales`).  
  - Exemples :
    - `dim_customers` → Table de dimension des clients  
    - `fact_sales` → Table de faits des ventes  

#### **Glossaire des préfixes**

| Préfixe     | Signification                     | Exemple(s)                              |
|-------------|----------------------------------|-----------------------------------------|
| `dim_`      | Table de dimension               | `dim_customer`, `dim_product`           |
| `fact_`     | Table de faits                   | `fact_sales`                            |
| `report_`   | Table de reporting               | `report_customers`, `report_sales_monthly` |

---

## **Conventions de nommage des colonnes**

### **Clés substitutives**
- Toutes les clés primaires des tables de dimension doivent utiliser le suffixe `_key`.
- **`<table_name>_key`**  
  - `<table_name>` : Nom de la table ou entité associée  
  - `_key` : Indique qu’il s’agit d’une clé substitutive  
  - Exemple : `customer_key` → Clé substitutive dans la table `dim_customers`

---

### **Colonnes techniques**
- Toutes les colonnes techniques doivent commencer par le préfixe `dwh_`, suivi d’un nom descriptif.
- **`dwh_<column_name>`**  
  - `dwh` : Préfixe réservé aux métadonnées générées par le système  
  - `<column_name>` : Nom décrivant le rôle de la colonne  
  - Exemple : `dwh_load_date` → Date de chargement du record

---

## **Procédures stockées**

- Toutes les procédures stockées utilisées pour charger les données doivent suivre le format :
- **`load_<layer>`**

  - `<layer>` : Couche cible (`bronze`, `silver`, `gold`)
  - Exemples :
    - `load_bronze` → Chargement des données dans la couche Bronze  
    - `load_silver` → Chargement des données dans la couche Silver  
