-- Sélectionner les 2 tables
SELECT * 
FROM region 
JOIN contrat ON region.code_postal = contrat.code_postal;

-- Quels sont les contrats avec le prix de la cotisation et leur surface pour les appartements ?
SELECT 
    contrat_id, 
    prix_cotisation_mensuel, 
    surface
FROM contrat
WHERE type_local = 'Appartement';

-- Lister les numéros de contrats (contrat_ID) avec leur surface pour la commune de Caen
SELECT 
    contrat_id, 
    surface
FROM contrat
WHERE LOWER(commune) = 'caen';

-- Lister les numéros de contrats (contrat_ID), avec le type de contrat et leur formule pour les maisons du département de la Saône-et-Loire (Département 71)
SELECT 
    contrat_id, 
    type_contrat, 
    formule
FROM contrat
WHERE LOWER(type_local) = 'maison' 
  AND code_departement = '71';

-- Lister le nom des régions de France
SELECT DISTINCT reg_nom 
FROM region;

-- Le nombre de contrats sur les résidences principales
SELECT COUNT(*) 
FROM contrat 
WHERE type_contrat = 'Residence principale';

-- Surface moyenne des logements avec contrat sur Paris
SELECT AVG(surface) 
FROM contrat 
WHERE LOWER(commune) LIKE 'paris%';

-- Les 5 contrats ayant les surfaces les plus élevées
SELECT * 
FROM contrat 
ORDER BY surface DESC 
LIMIT 5;

-- Le prix moyen de la cotisation mensuelle
SELECT AVG(prix_cotisation_mensuel) 
FROM contrat;

-- Nombre de contrats pour chaque catégorie de prix de la valeur déclarée des biens
SELECT 
    valeur_declaree_biens, 
    COUNT(*) 
FROM contrat 
GROUP BY valeur_declaree_biens;

-- Classements des 10 départements où le prix moyen de la cotisation est le plus élevé
SELECT 
    code_departement,
    AVG(prix_cotisation_mensuel) AS prix_moyen 
FROM contrat 
GROUP BY code_departement 
ORDER BY prix_moyen DESC 
LIMIT 10;

-- Nombre de contrats avec formules intégral pour la région Pays de la Loire
SELECT COUNT(*) 
FROM contrat  
LEFT JOIN region ON contrat.code_postal = region.code_postal 
WHERE reg_nom = 'Pays de la Loire' 
  AND LOWER(formule) = 'integral';

-- Liste des communes ayant eu au moins 150 contrats
SELECT 
    Commune, 
    COUNT(*)
FROM contrat
GROUP BY Commune
HAVING COUNT(*) >= 150;

-- Le nombre de contrats pour chaque région
SELECT 
    r.reg_nom,
    COUNT(c.contrat_id)  
FROM contrat c 
LEFT JOIN region r ON c.code_postal = r.code_postal 
GROUP BY r.reg_nom;
