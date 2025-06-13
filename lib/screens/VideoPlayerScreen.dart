import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isSeeking = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (!_isSeeking) {
        setState(() {}); 
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rewind() {
    final currentPosition = _controller.value.position;
    final rewindPosition = currentPosition - const Duration(seconds: 10);
    _controller.seekTo(rewindPosition > Duration.zero ? rewindPosition : Duration.zero);
  }

  void _forward() {
    final currentPosition = _controller.value.position;
    final duration = _controller.value.duration;
    final forwardPosition = currentPosition + const Duration(seconds: 10);
    if (forwardPosition < duration) {
      _controller.seekTo(forwardPosition);
    } else {
      _controller.seekTo(duration);
    }
  }

  void _download() async {
    final url = Uri.parse(widget.videoUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo abrir el enlace de descarga')),
      );
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = _controller.value.isInitialized;
    final position = isInitialized
        ? _controller.value.position.inMilliseconds.toDouble()
        : 0.0;
    final duration = isInitialized
        ? _controller.value.duration.inMilliseconds.toDouble()
        : 1.0; 

    final sliderValue = position.clamp(0.0, duration);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Video'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  const SizedBox(height: 20),


                  Slider(
                    activeColor: Colors.yellow,
                    inactiveColor: Colors.grey,
                    min: 0,
                    max: duration,
                    value: sliderValue,
                    onChangeStart: (_) {
                      _isSeeking = true;
                    },
                    onChanged: (value) {
                      setState(() {
                        _controller.seekTo(Duration(milliseconds: value.toInt()));
                      });
                    },
                    onChangeEnd: (_) {
                      _isSeeking = false;
                    },
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(_controller.value.position),
                          style: const TextStyle(color: Colors.yellow),
                        ),
                        Text(
                          _formatDuration(_controller.value.duration),
                          style: const TextStyle(color: Colors.yellow),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10),
                        iconSize: 36,
                        color: Colors.yellow,
                        onPressed: _rewind,
                      ),
                      IconButton(
                        icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                        iconSize: 36,
                        color: Colors.yellow,
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.forward_10),
                        iconSize: 36,
                        color: Colors.yellow,
                        onPressed: _forward,
                      ),
                      IconButton(
                        icon: const Icon(Icons.download),
                        iconSize: 36,
                        color: Colors.yellow,
                        onPressed: _download,
                      ),
                    ],
                  )
                ],
              )
            : const CircularProgressIndicator(color: Colors.yellow),
      ),
    );
  }
}
