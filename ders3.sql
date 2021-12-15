/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu*/
	SELECT COUNT(InvoiceId) AS kaç_fatura_var FROM invoices;
	SELECT COUNT(*) AS kaç_fatura_var FROM invoices;
	
		/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
		SELECT COUNT(DISTINCT Composer) as besteci_sayısı FROM tracks;
		
		
	/*  ÖDEV: invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 
		/* ödevvvv invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */
	
	/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
	sorguyu yaziniz */
	SELECT name as song_name, min(Milliseconds)/1000.0 as duration FROM tracks;
	
	
	SELECT min(Grade), max(Grade)from students;
	
		/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
	select sum(total)AS TOPLAM_GELİR from invoices;
		/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
	select AVG(total) AS ORT_GELİR from invoices;
	select ROUND(AVG(total)) AS ORT_GELİR from invoices;
	
	select ROUND(AVG(total),3) AS ORT_GELİR from invoices;
	
		/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	SELECT Milliseconds
	FROM tracks
	WHERE Milliseconds>(SELECT avg(Milliseconds) FROM tracks);
	
	
	SELECT ROUND(AVG(Milliseconds)) from tracks;
	select name, Milliseconds FROM tracks WHERE Milliseconds>(SELECT AVG(Milliseconds) from tracks);
	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	SELECT ROUND(AVG(Milliseconds))
	FROM tracks;
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > 393599;
	
	/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	SELECT Name, Milliseconds
	FROM tracks
	WHERE Milliseconds > ( 	SELECT AVG(Milliseconds)FROM tracks);
	/*=================group by=============*/
	
	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	SELECT Composer,COUNT(name) as song_count FROM tracks
    WHERE Composer IS NOT NULL 
    GROUP BY Composer;	
	
	
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/				
	SELECT country, count(CustomerId) as number_of_cust
    FROM customers	
	GROUP BY country
	ORDER BY number_of_cust DESC;
		
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/								
	SELECT country,city,COUNT(FirstName) as customer_num
	FROM customers
	GROUP BY country, city;		

	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/	
	
	SELECT BillingCountry, avg(total) as ort_fatura FROM invoices GROUP BY BillingCountry;
	
	
	SELECT BillingCountry,ROUND(avg(total),2) as ort_fatura FROM invoices 
	WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23:59:59'
	GROUP BY BillingCountry;
	
	/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
	SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_tarihi, siparis_adedi
 from markalar
 INNER JOIN siparisler
 ON markalar.marka_id = siparisler.marka_id
 
 
 SELECT markalar.marka_id, markalar.marka_adi, siparisler.siparis_tarihi, siparis_adedi
 from markalar
 LEFT JOIN siparisler
 ON markalar.marka_id = siparisler.marka_id;
 
	
	
	
	
	
	
	
	
	
	
	
	
	
	