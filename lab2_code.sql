-- ВЫБРАТЬ ТОВАР У КОТОРОГО ЗАКОНЧИЛСЯ СРОК ГОДНОСТИ
SELECT * FROM products
WHERE shelf_life < CURRENT_DATE;
