import 'package:nirvanafit/core/constants/constants.dart';
import 'package:nirvanafit/core/constants/static_assets.dart';
import 'package:nirvanafit/features/sounds_theraphy/model/audio_player_model.dart';

final List<AudioPlayerModel> audioPlayerList = [
  //Soothing Music
  AudioPlayerModel(
    title: "Indian Classical Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Findianclassicalmusic.mp3?alt=media&token=90b53ccd-09b1-4197-b1ef-c993f3a87580",
    imageUrl: StaticAssets.indianClassicalMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Findian_classical_music.jpeg?alt=media&token=ece21692-1377-42a8-b981-dbd7020d5e90',
  ),
  AudioPlayerModel(
    title: "Meditative & Healing Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fmeditativeandhealingmusic.mp3?alt=media&token=c38896d5-effa-4978-b816-d695c9ff712c",
    imageUrl: StaticAssets.meditationAndHealingMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fmeditation_and_healing_music.jpeg?alt=media&token=6a02e63c-bab1-4222-8b28-595353b9edeb',
  ),
  AudioPlayerModel(
    title: "Nature Sounds",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fnaturesounds.mp3?alt=media&token=04aa2f1a-61a7-450a-973b-3ac27c14a553",
    imageUrl: StaticAssets.natureSoundsSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fnature_sounds.jpeg?alt=media&token=ec41f36a-1c3a-4df2-9db0-074aa3bbf3af',
  ),
  AudioPlayerModel(
    title: "Chill out Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fchilloutmusic.mp3?alt=media&token=1520097e-9cce-4256-a6e8-12a07e865452",
    imageUrl: StaticAssets.chillOutMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fchill_out_music.jpeg?alt=media&token=ffc04987-36c3-41ea-bad5-58e90b7875a9',
  ),
  AudioPlayerModel(
    title: "Ambient Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fambientmusic.mp3?alt=media&token=154e92a5-d4a3-48d0-a352-321078c3f4a2",
    imageUrl: StaticAssets.ambientMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fambient_music.jpeg?alt=media&token=94947e0e-a884-4ecb-96c7-a3ff9d548ecc',
  ),
  AudioPlayerModel(
    title: "New Age Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fnewagemusic.mp3?alt=media&token=20fa8e7e-44e0-40f4-b2e1-7a250fc653e2",
    imageUrl: StaticAssets.newAgeMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fnew_age_music.jpeg?alt=media&token=414eeeae-5c8a-41c0-ab6c-8a9b9d2160b4',
  ),
  AudioPlayerModel(
    title: "Instrumental Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Finstrumentalmusic.mp3?alt=media&token=b849d6f2-029a-405a-9aec-eac626e99163",
    imageUrl: StaticAssets.instrumentalMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Finstrumental_music.jpeg?alt=media&token=bf870894-696f-4361-b2d6-ddb47b501e9e',
  ),
  AudioPlayerModel(
    title: "Piano Instrumentals",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fpianoinstrumentals.mp3?alt=media&token=5d135c5c-2e54-4ee4-92b8-54ffb9778574",
    imageUrl: StaticAssets.pianoInstrumentalsSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fpiano_instrumentals.jpeg?alt=media&token=36588dd6-86c1-4e50-a6ce-85041892936f',
  ),
  AudioPlayerModel(
    title: "Minimalism Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fminimalismmusic.mp3?alt=media&token=d23e8f0c-1ced-4c0e-9bb0-6ee1cd91db74",
    imageUrl: StaticAssets.minimalismMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fminimalism_music.jpeg?alt=media&token=54cfc9aa-2c01-415d-88f4-622497eb615f',
  ),
  AudioPlayerModel(
    title: "Sound Baths",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fsoundbaths.mp3?alt=media&token=23fab883-d7ec-43a4-a678-3f556a79b01e",
    imageUrl: StaticAssets.soundBathsSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fsound_baths.jpeg?alt=media&token=adcf92c1-6706-42fe-8d3b-d35675ea65c8',
  ),
  AudioPlayerModel(
    title: "Jazz Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fjazzmusic.mp3?alt=media&token=c553a081-af7f-4c99-9619-7ea3b7fcabba",
    imageUrl: StaticAssets.jazzMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fjazz_music.jpeg?alt=media&token=e1f8c9b4-bd88-4dcf-add3-4a230abf32fa',
  ),
  AudioPlayerModel(
    title: "Spa Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fspamusic.mp3?alt=media&token=297044ce-e393-4af0-8622-d799801ebe2c",
    imageUrl: StaticAssets.spaMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fspa_music.jpeg?alt=media&token=146b0b01-cd0b-47a2-ac45-ffaefbaa2784',
  ),
  AudioPlayerModel(
    title: "Lo-Fi Hip Hop Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Flofihiphopmusic.mp3?alt=media&token=abe32a93-68d8-4ae1-8f83-ff28bd6f7ceb",
    imageUrl: StaticAssets.loFIHipHopMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Flo_fi_hip_hop_music.jpeg?alt=media&token=00fd2dcd-0c91-44ed-a918-aab2d8febb41',
  ),
  AudioPlayerModel(
    title: "Acoustic Music",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Facouticmusic.mp3?alt=media&token=c259c048-cd7e-4309-9a84-b7ba7aab8120",
    imageUrl: StaticAssets.acousticMusicSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Facoustic_music.jpeg?alt=media&token=6d46e887-a460-4975-8382-1ce2c3802ed4',
  ),
  AudioPlayerModel(
    title: "Soundtracks & Film Scores",
    subtitle: Constants.appTitle,
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Fsoundtrackandfilmscores.mp3?alt=media&token=55967f9d-dd67-466d-9b8c-b2152308cef2",
    imageUrl: StaticAssets.soundtracksAndFilmScoreSM, firebaseImageUrl: 'https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%20images%2Fsoundtracks_and_film_score.jpeg?alt=media&token=175b39f4-bcc1-47dd-9955-7cdc1a727ebe',
  ),

  //Binaural Beats
  AudioPlayerModel(
    title: "Deep Sleep",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fdeepsleep.mp3?alt=media&token=2314bc5e-4ca0-47b2-8216-f4ed1a645ee2",
    imageUrl: StaticAssets.deepSleepBB,
  ),
  AudioPlayerModel(
    title: "Creativity Boost",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fcreativityboost.mp3?alt=media&token=96aa373c-67a9-445b-9831-a726b8670691",
    imageUrl: StaticAssets.creativityBoostBB,
  ),
  AudioPlayerModel(
    title: "Memory Boost",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fmemoryboost.mp3?alt=media&token=fb42211a-7182-43fe-b0ff-5afcc909235b",
    imageUrl: StaticAssets.memoryBoostBB,
  ),
  AudioPlayerModel(
    title: "Unlock Hidden Genius",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Funlockhiddengenius.mp3?alt=media&token=5f15782d-aa93-4689-b898-dbd2c66031b0",
    imageUrl: StaticAssets.unlockHiddenGeniusBB,
  ),
  AudioPlayerModel(
    title: "Nirvana Meditation Aid",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fnirvanameditationaid.mp3?alt=media&token=af524dc5-d68e-4dbe-bb39-b2175fcd47ad",
    imageUrl: StaticAssets.nirvanaMeditationAidBB,
  ),
  AudioPlayerModel(
    title: "Enhanced Focus",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fenhancedfocus.mp3?alt=media&token=7b1066d3-d6e5-4ccb-bd44-3f7ad8308cd5",
    imageUrl: StaticAssets.enhancedFocusBB,
  ),
  AudioPlayerModel(
    title: "Mood Enhancement",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fmoodenhancement.mp3?alt=media&token=b629ebe7-ab75-4929-a3a4-89a5fa33d5c6",
    imageUrl: StaticAssets.moodEnhancementBB,
  ),
  AudioPlayerModel(
    title: "Relaxation & Stress Relief",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Frelaxationandstressrelief.mp3?alt=media&token=cf2ba8ed-4d3b-4c61-859b-9b67c0e88ecc",
    imageUrl: StaticAssets.relaxationAndStressReliefBB,
  ),
  AudioPlayerModel(
    title: "Improved Brain Sync",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fimprovedbrainsync.mp3?alt=media&token=449ac909-6b88-44c0-bcab-2ba7f6503ad2",
    imageUrl: StaticAssets.improvedBrainSyncBB,
  ),
  AudioPlayerModel(
    title: "Deep Concentration (Gamma)",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fdeepconcentrationgamma.mp3?alt=media&token=cd14cdcd-a343-419c-92f3-35aaa62bdef6",
    imageUrl: StaticAssets.deepConcentrationGammaBB,
  ),
  AudioPlayerModel(
    title: "Alertness & Energy (Beta)",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Falertnessandenergybeta.mp3?alt=media&token=c00b40bf-aa06-4997-a9ab-c5f679a24571",
    imageUrl: StaticAssets.alertnessAndEnergyBetaBB,
  ),
  AudioPlayerModel(
    title: "Relaxed & Awake (Alpha)",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Frelaxedandawakealpha.mp3?alt=media&token=c47455de-4c5b-4205-96e9-6c1f9ab02cdb",
    imageUrl: StaticAssets.relaxedAndAwakeAlphaBB,
  ),
  AudioPlayerModel(
    title: "Deep Relaxation (Theta)",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fdeeprelaxationtheta.mp3?alt=media&token=923a54cf-e230-4cb1-8164-d17da21421a7",
    imageUrl: StaticAssets.deepRelaxationThetaBB,
  ),
  AudioPlayerModel(
    title: "Lucid Dreaming (Alpha & Theta)",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fluciddreamingalphaandtheta.mp3?alt=media&token=4ff3e202-2cc7-47a3-9989-6a852abd7608",
    imageUrl: StaticAssets.lucidDreamingAlphaAndThetaBB,
  ),
  AudioPlayerModel(
    title: "Astral Projection (Delta)",
    subtitle: '(Headphones Recommended)',
    audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/binaural%20beats%2Fastralprojectiondelta.mp3?alt=media&token=92d07cab-a460-476a-a2a3-453f8490b991",
    imageUrl: StaticAssets.astralProjectionDeltaBB,
  ),
];

// List.generate(
//   soothingMusicContentsList.length,
//   (index) => AudioPlayerModel(
//     title: soothingMusicContentsList[index].title,
//     subtitle: Constants.appTitle,
//     audioUrl: index % 2 == 0
//         ? "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Findianclassicalmusic.mp3?alt=media&token=90b53ccd-09b1-4197-b1ef-c993f3a87580"
//         : "https://firebasestorage.googleapis.com/v0/b/brainbooster-4aab3.appspot.com/o/soothing%20music%2Facouticmusic.mp3?alt=media&token=c259c048-cd7e-4309-9a84-b7ba7aab8120",
//     imageUrl: soothingMusicContentsList[index].image,
//   ),
// );
