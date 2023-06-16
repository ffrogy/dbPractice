
--1.	김선해 고객의 전화번호를 찾아라.
select name, phone
from customer
where name='김선해';

--2.	모든 도서의 이름과 가격을 검색해라.
select bookname, price
from book;

--3.	모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색해라.
select bookid, bookname, publisher, price
from book;

--4.	도서 테이블에 있는 모든 출판사를 검색해라. (중복제거해서)
select distinct publisher
from book;

--5.	가격이 20000원 미만인 도서를 검색해라.
select *
from book
where price < 20000;

--6.	가격이 10000원 이상 20000 이하인 도서를 검색해라.
select *
from book
where price between 10000 and 20000;

--7.	출판사가 ‘아이티’ 혹은 ‘이젠’ 인 도서를 검색해라.
select *
from book
where publisher='아이티' or publisher = '이젠';

--8.	출판사가 ‘아이티’ 혹은 ‘이젠’ 아닌 도서를 검색해라.
select *
from book
where not (publisher = '아이티' or publisher = '이젠');

--9.	‘컴퓨터의 역사’를 출간한 출판사를 검색해라.
select bookname, publisher
from book
where bookname='컴퓨터의 역사';

--10.	도서이름에 ‘컴퓨터’가 포함된 출판사를 검색해라.
select bookname, publisher
from book
where bookname like '%컴퓨터%';

--11.	도서이름의 왼쪽 두번 째에 ‘퓨’라는 문자열을 갖는 도서를 검색해라.
select *
from book
where bookname like '_퓨%';

--12.	컴퓨터에 관한 도서 중 가격이 20000원 이상인 도서를 검색해라.
select *
from book
where bookname like '%컴퓨터%' and price >= 20000;

--13.	도서를 이름순으로 검색해라.
select *
from book
order by bookname;

--14.	도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색해라.
select *
from book
order by price, bookname;

--15.	도서를 가격의 내림차순으로 검색해라. 가격이 같다면 출판사의 오름차순으로 검색해라.
select *
from book
order by price asc, publisher desc;

--16.	고객이 주문한 도서의 총 판매액을 구해라.
select sum(saleprice)
from orders;

--17.	2번 김선해 고객이 주문한 도서의 총 판매액을 구해라.
select sum(saleprice)
from orders
where custid = 2;

--18.	고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구해라.
select sum(saleprice) 총액, avg(saleprice) 평균값, min(saleprice) 최저가, max(saleprice) 최고가
from orders;

--19.	1402서점의 도서 판매 건수를 구해라.
select count(orderid) 판매횟수
from orders;

--20.	고객별로 주문한 도서의 총 수량과 총 판매액을 구해라.
select custid, count(orderid) 구매수량, sum(saleprice) 총액
from orders
group by custid;

--21.	가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구해라. 단, 두 권 이상 구매한 고객만 구해라.
select orders.custid, count(custid) 구매수량
from orders, book
where orders.bookid = book.bookid and book.price>=8000
group by custid;

--22.	고객과 고객의 주문에 관한 데이터를 모두 보여라.
select *
from orders o, customer c
where c.custid=o.custid;

--23.	고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보여라.
select *
from orders o, customer c
where c.custid=o.custid
order by c.custid;

--24.	고객의 이름과 고객이 주문한 도서의 판매가격을 검색해라.
select c.name, saleprice
from customer c, orders o
where o.custid = c.custid;

--25.	고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬해라.
select c.name, sum(saleprice) 총판매액
from customer c, orders o
where o.custid = c.custid
group by c.name
order by c.name;

--26.	고객의 이름과 고객이 주문한 도서의 이름을 구해라.
select customer.name, bookname
from customer, book, orders
where orders.bookid=book.bookid and orders.custid=customer.custid;

--27.	가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구해라.
select c.name, bookname
from customer c, book b, orders o
where o.bookid = b.bookid and o.custid = c.custid and price = 20000;

--28.	도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구해라.
SELECT customer.name,orders.saleprice 
FROM customer LEFT OUTER JOIN orders ON customer.custid = orders.custid;

--29.	가장 비싼 도서의 이름을 구해라.
select bookname, price
from book
where price = (select max(price) from book);

--30.	도서를 구매한 적이 있는 고객의 이름을 검색해라.
select c.name
from customer c, orders o
where c.custid = o.custid
group by c.name;

--31.	이젠에서 출판한 도서를 구매한 고객의 이름을 보여라.
select c.name
from customer c
where c.custid in (select custid from orders where bookid in (select bookid from book where publisher ='이젠'));

--32.	출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구해라.
select b1.bookname
from book b1
where b1.price > (select avg(b2.price) from book b2 where b1.publisher = b2.publisher);

--33.	Book테이블에 새로운 도서 ‘공학 도서’를 삽입해라. 공학 도서는 더샘에서 출간했으며 가격을 40000원이다.
insert into book values(seq_book.nextval, '공학 도서', '더샘', 40000);

--34.	Book테이블에 새로운 도서 ‘공학 도서’를 삽입해라. 공학 도서는 더샘에서 출간했으며 가격은 미정이다.
insert into book(bookid,bookname,publisher) values(seq_book.nextval, '공학 도서', '더샘');

--35.	Customer테이블에서 고객번호가 5인 고객의 주소를 ‘서울시 서초구’로 변경해라.
update customer set address = '서울시 서초구' where custid = 5;

--36.	Customer테이블에서 박승철 고객의 주소를 김선해 고객의 주소로 변경해라.
update customer set address = (select address from customer where name='김선해') where name = '박승철';

--37.	아이티에서 출판한 도서의 제목과 제목의 글자수를 확인해라.
select bookname, length(bookname) 글자수
from book
where publisher = '아이티';

--38.	1402서점의 고객 중에서 같은 성(이름 성)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구해라.
select substr(name, 1,1), count(*) from customer
group by substr(name,1,1);

--39.	1402서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구해라.
select orderdate, orderdate+10 확정일
from orders;

--40.	1402서점이 2022년 5월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보여라. 주문일은 ‘yyyy-mm-dd요일’형태로 표시한다.
select orderid, to_char(orderdate, 'yyyy-mm-dd day') 주문일, custid, bookid
from orders
where orderdate = '2022-05-07';

--41.	이름, 전화번호가 포함된 고객목록을 보여라. 단, 전화번호가 없는 고객은 ‘연락처없음’으로 표시해라.
select name, nvl(phone, '연락처 없음')
from customer;

--42.	평균 주문금액 이하의 주문에 대해 주문번호와 금액을 보여라.
select orderid, saleprice
from orders
where saleprice < (select avg(saleprice) from orders);

--43.	각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해 주문번호, 고객번호, 금액을 보여라.
select orderid, custid, saleprice
from orders o1
where saleprice > (select avg(saleprice) from orders o2 where o1.custid = o2.custid);

--44.	서울시에 거주하는 고객에게 판매한 도서의 총판매액을 구해라.
select sum(saleprice)
from orders
where custid in (select custid from customer where address like '서울시%');

--45.	Customer테이블에서 고객번호가 5인 고객을 삭제해라.
delete from customer where custid = 5;