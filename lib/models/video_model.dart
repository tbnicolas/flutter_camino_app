class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;
  final String description;
  final String isLive;
  Video({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.channelTitle,
    this.description,
    this.isLive
  });

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      description: snippet['description'],
      channelTitle: snippet['channelTitle'],
      isLive: snippet['liveBroadcastContent']
    );
  }
}