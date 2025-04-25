terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.5"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artists = ["GV Prakash"]
  name    = "Hey Minnale"
}

resource "spotify_playlist" "playlist" {
  name        = "MohanSpotify"
  description = "Create a Spotify playlist using Terraform. sampleTerraform/tutorials/terraform/spotify-playlist"

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}
