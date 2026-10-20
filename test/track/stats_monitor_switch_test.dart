import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;

import 'package:livekit_client/livekit_client.dart';

class _FakeStream extends Fake implements rtc.MediaStream {}

class _FakeTrack extends Fake implements rtc.MediaStreamTrack {
  @override
  String? get id => 'track';

  @override
  bool get enabled => true;

  @override
  set enabled(bool value) {}

  @override
  Future<void> stop() async {}
}

class _TestTrack extends Track {
  _TestTrack() : super(TrackType.AUDIO, TrackSource.microphone, _FakeStream(), _FakeTrack());

  int polls = 0;

  @override
  Future<bool> monitorStats() async {
    polls++;
    return true;
  }
}

/// UCHAT3-40288: apps that never read track stats can turn the 2 s stats monitor off. Each poll
/// walks every sender and receiver on the platform thread, which froze Android group calls.
void main() {
  tearDown(() => Track.statsMonitorEnabled = true);

  testWidgets('the stats monitor polls by default', (tester) async {
    final track = _TestTrack();
    await track.start();
    await tester.pump(const Duration(seconds: 5));
    expect(track.polls, 2);
    await track.stop();
  });

  testWidgets('turning the monitor off keeps a started track from polling', (tester) async {
    Track.statsMonitorEnabled = false;
    final track = _TestTrack();
    await track.start();
    await tester.pump(const Duration(seconds: 5));
    expect(track.polls, 0);
    await track.stop();
  });
}
