-- ВЫБРАТЬ ТОВАР У КОТОРОГО ЗАКОНЧИЛСЯ СРОК ГОДНОСТИ
SELECT * FROM products
WHERE shelf_life < CURRENT_DATE;

-- выбрать все ножницы с пластмассывми ручками ораньжего цвета
SELECT *
FROM products
WHERE LOWER(name) LIKE '%ножниц%'
  AND LOWER(characteristics) LIKE '%пластмасс%'
  AND LOWER(color) LIKE '%оранжев%'; 

  -- 3. Создать таблицу, содержащую данные 2 запроса с указанием номеров заказов
CREATE TABLE scissors_orders AS
SELECT 
    oc.order_number,
    p.product_code,
    p.name,
    p.pieces_per_package,
    p.color,
    p.characteristics,
    p.country_of_origin,
    p.manufacturer,
    p.shelf_life
FROM products p
JOIN order_contents oc ON p.product_code = oc.product_code
WHERE LOWER(p.name) LIKE '%ножниц%'
  AND LOWER(p.characteristics) LIKE '%пластмасс%'
  AND LOWER(p.color) LIKE '%оранжев%';

-- 4. Добавить в созданную таблицу номера заказов, содержащих любые канцтовары
INSERT INTO scissors_orders (
    order_number,
    product_code,
    name,
    pieces_per_package,
    color,
    characteristics,
    country_of_origin,
    manufacturer,
    shelf_life
)
SELECT 
    oc.order_number,
    p.product_code,
    p.name,
    p.pieces_per_package,
    p.color,
    p.characteristics,
    p.country_of_origin,
    p.manufacturer,
    p.shelf_life
FROM products p
JOIN order_contents oc ON p.product_code = oc.product_code
WHERE LOWER(p.name) LIKE '%канцтовар%' 
   OR LOWER(p.characteristics) LIKE '%канцтовар%';
Select * FROM scissors_orders;


-- 5. В созданной таблице для каждого товара, у которого не указан производитель, изменить цвет на черный
UPDATE scissors_orders
SET color = 'чёрный'
WHERE manufacturer IS NULL OR TRIM(manufacturer) = '';
