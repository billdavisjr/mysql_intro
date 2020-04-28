
-- List all Artists, Albums & Tracks in the Grunge playlist

Select Playlist.Name as Playlist, Track.Name as Track, Album.Title as Album, Artist.Name as Artist
From Playlist
Inner Join PlaylistTrack 
 on Playlist.PlaylistId = PlaylistTrack.PlaylistId
Inner Join Track on Track.TrackId = PlaylistTrack.TrackId
Inner Join Album on Album.AlbumId = Track.AlbumId
Inner Join Artist on Artist.ArtistId = Album.ArtistId
Where Playlist.Name = 'Grunge'
Order By Artist.Name, Album.Title, Track.Name
;
