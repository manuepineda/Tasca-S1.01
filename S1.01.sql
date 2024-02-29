#nivel 1

#Ej 1

Select * from company;

# La tabla company contiene una lista de compañias, distingibles mediante los campos ID & company name.
# se incluyen datos de contacto en los campos phone y email. Ademas, hay info del pais de origen de la empresa y su pagina web en los campos country y website

Select * from transaction;

# La tabla transaction contiene información de las transacciones que se realizan en las diferentes compañias indicadas en la tabla company.
# Se incluye un ID unico de transaccion en la tabla id, que lleva un id de tarjeta de crédito (credit_card_id) , usuario que realiza el pago (user_id), compañia que recibe el pago (company_id), 
# lat/longitude coordenadas donde se realiza la transaccion, timestamp momento en el que se realiza la transaccion, amount cantidad de dinero pagado, declined, 
# si es 0 la transaccion se realizo satisfactoriamente y si es 1, se declinó

#Relacion entre ambas, descripcion de la foto

#La relacion entre las tablas es de company (1) ---> transaction (N). La PK es ID VARCHAR (company) y la FK de la misma es company_id (transaction)

#Ej 2

SELECT company.company_name, company.email, company.country
FROM company
order by company_name;

#Ej 3

SELECT DISTINCT company.country
from company
JOIN transaction
ON transaction.company_id = company.id
WHERE DECLINED = 0
order by country;

#Ej 4

SELECT count(distinct country)
from company
JOIN transaction
ON transaction.company_id = company.id
WHERE DECLINED = 0;

/* ESTO TE CUENTA LAS TRANSACCIONES POR PAIS
SELECT country, count(country)
from company
JOIN transaction
ON transaction.company_id = company.id
WHERE DECLINED = 0
group by country
order by country;
*/

#Ej 5

SELECT company_name
from company
where id = "b-2354";


#Ej 6

Select  company_name, AVG (transaction.amount)
from transaction
JOIN company
ON transaction.company_id = company.id
where declined = "0"
group by company_name
order by  AVG (transaction.amount) DESC
LIMIT 1;

#nivel 2

#Ej 1

SELECT id, count(id)
from company
group by id
having count(id) > 1;

SELECT COUNT(ID) AS duplicate_count
FROM (
    SELECT ID, COUNT(ID) AS count
    FROM company
    GROUP BY ID
    HAVING count > 1
) AS duplicates;

#Ej 2

SELECT left(timestamp, 10) as date, sum(amount) # left te coge la parte izq, en este caso el dia de calendario, 
# esto lo hacemos para que haya dias agrupables si se incluye la hora todos los timestamps son unicos
FROM transaction
where declined = 0
group by date
order by sum(amount) DESC
limit 5;

#Ej 3

SELECT left(timestamp, 10) as date, sum(amount) # left te coge la parte izq, en este caso el dia de calendario, 
# esto lo hacemos para que haya dias agrupables si se incluye la hora todos los timestamps son unicos
FROM transaction
where declined = 0
group by date
order by sum(amount) ASC
limit 5;

#Ej 4

SELECT country, avg(amount) as media
from transaction
JOIN company
ON transaction.company_id = company.id
group by country
order by media DESC; 


#nivel 3

#Ej 1

Select company_name, phone, country, amount
from company
JOIN transaction
ON transaction.company_id = company.id
where amount BETWEEN 100 AND 200
order by amount DESC;

#Ej 2

Select company_name, timestamp
from company 
JOIN transaction
ON transaction.company_id = company.id
where timestamp BETWEEN "2022-02-13" AND "2022-02-28"
order by timestamp;

 
  