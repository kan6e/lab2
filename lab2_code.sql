-- ВЫБРАТЬ ТОВАР У КОТОРОГО ЗАКОНЧИЛСЯ СРОК ГОДНОСТИ
SELECT * FROM products
WHERE shelf_life < CURRENT_DATE;

-- выбрать все ножницы с пластмассывми ручками ораньжего цвета
SELECT *
FROM products
WHERE LOWER(name) LIKE '%ножниц%'
  AND LOWER(characteristics) LIKE '%пластмасс%'
  AND LOWER(color) LIKE '%оранжев%'; 
