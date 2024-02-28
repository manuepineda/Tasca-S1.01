#nivel 1

#Ej 1

Select * from company;

# La tabla company contiene una lista de compañias, distingibles mediante los campos ID & company name.
# se incluyen datos de contacto en los campos phone y email. Ademas, hay info del pais de origen de la empresa y su pagina web en los campos country y website

Select * from transaction;

# La tabla transaction contiene información de las transacciones que se realizan en las diferentes compañias indicadas en la tabla company.
# Se incluye un ID unico de transaccion en la tabla id, que lleva un id de tarjeta de crédito (credit_card_id) , usuario que realiza el pago (user_id), compañia que recibe el pago (company_id), 
# lat/longitude coordenadas donde se realiza la transaccion, timestamp momento en el que se realiza la transaccion, amount cantidad de dinero pagado, declined, si es 0 la transaccion se realizo satisfactoriamente y si es 1, se declinó

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

#ej 1

SELECT count(id)
from company
group by id;

#nivel 3


