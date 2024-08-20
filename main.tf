terraform{
    required_providers {
      spotify = {
        version = "~> 0.2.6"
        source = "conradludgate/spotify"
      }
    }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist"{
    artist = "Dolly Parton"
}

resource "spotify_playlist" "playlist" {
  name = "Terraform playlist"
  description = "Custom playlist created by terraform"
  public = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}

