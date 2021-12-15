SELECT AlbumId,count(AlbumId) FROM tracks GROUP BY AlbumId ORDER by count(AlbumId) DESC;

SELECT albums.Title,TRACKS.name FROM albums INNER JOIN tracks ON albums.AlbumId= tracks.AlbumId;

SELECT albums.AlbumId,albums.Title ,min(tracks.Milliseconds)
FROM albums INNER JOIN tracks 
ON albums.AlbumId= tracks.AlbumId GROUP BY Title order by Milliseconds DESC;


SELECT albums.AlbumId,albums.Title,sum(tracks.Milliseconds)
FROM albums INNER JOIN tracks 
ON albums.AlbumId= tracks.AlbumId GROUP BY	Title order by SUM(tracks.Milliseconds) DESC;
