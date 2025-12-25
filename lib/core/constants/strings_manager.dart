/// Spectra Strings Manager
/// Centralized string constants for localization support and consistency.
/// All UI-facing strings are stored here for easy maintenance and translation.
///
/// Categories:
/// - App: General app-level strings
/// - Onboarding: Onboarding flow strings
/// - Roles: User role related strings
/// - Avatar: Avatar selection strings
/// - Sensory: Sensory profile strings
/// - Mascot: Rafiq mascot strings
/// - Common: Reusable common strings
class StringsManager {
  StringsManager._(); // Private constructor

  // ============================================================
  // APP STRINGS
  // ============================================================

  /// App name
  static const String appName = 'Spectra';

  // ============================================================
  // ONBOARDING - ROLE SELECTION (Screen 1.1)
  // ============================================================

  /// Role selection screen title
  static const String roleSelectionTitle = 'Who is using Spectra today?';

  /// Role selection screen subtitle
  static const String roleSelectionSubtitle =
      'Choose your profile to get started.';

  /// Child role title
  static const String roleChildTitle = 'I am a Child';

  /// Child role subtitle
  static const String roleChildSubtitle = 'Tap to start your journey';

  /// Parent role title
  static const String roleParentTitle = 'I am a Parent';

  /// Parent role subtitle
  static const String roleParentSubtitle = 'Configure settings & profile';

  /// Parent flow not implemented message
  static const String parentFlowComingSoon = 'Parent flow coming soon!';

  // ============================================================
  // ONBOARDING - CHILD PROFILE (Screen 1.2)
  // ============================================================

  /// Child profile screen title
  static const String childProfileTitle = 'Pick your buddy!';

  /// Child profile screen subtitle
  static const String childProfileSubtitle =
      'Choose a friend to accompany you.';

  /// Name input hint
  static const String nameInputHint = 'What is your name?';

  // ============================================================
  // ONBOARDING - AVATAR NAMES
  // ============================================================

  /// Avatar name - Leo
  static const String avatarLeo = 'Leo';

  /// Avatar name - Trunks
  static const String avatarTrunks = 'Trunks';

  /// Avatar name - Hops
  static const String avatarHops = 'Hops';

  /// Avatar ID - Leo
  static const String avatarIdLeo = 'leo';

  /// Avatar ID - Trunks
  static const String avatarIdTrunks = 'trunks';

  /// Avatar ID - Hops
  static const String avatarIdHops = 'hops';

  // ============================================================
  // ONBOARDING - SENSORY PROFILE (Screen 1.3)
  // ============================================================

  /// Sensory profile title prefix
  static const String sensoryProfileTitlePrefix = 'What bothers ';

  /// Sensory profile title suffix
  static const String sensoryProfileTitleSuffix = ' the most?';

  /// Sensory profile subtitle
  static const String sensoryProfileSubtitle = 'Select all that apply.';

  /// Animation speed label
  static const String animationSpeedLabel = 'Animation Speed';

  // ============================================================
  // SENSORY TRIGGERS
  // ============================================================

  /// Sensory trigger ID - Loud noises
  static const String triggerIdLoudNoises = 'loud_noises';

  /// Sensory trigger ID - Bright lights
  static const String triggerIdBrightLights = 'bright_lights';

  /// Sensory trigger ID - Scratchy clothes
  static const String triggerIdScratchyClothes = 'scratchy_clothes';

  /// Sensory trigger ID - Crowds
  static const String triggerIdCrowds = 'crowds';

  /// Sensory trigger label - Loud Noises
  static const String triggerLabelLoudNoises = 'Loud Noises';

  /// Sensory trigger label - Bright Lights
  static const String triggerLabelBrightLights = 'Bright Lights';

  /// Sensory trigger label - Scratchy Clothes
  static const String triggerLabelScratchyClothes = 'Scratchy Clothes';

  /// Sensory trigger label - Crowds
  static const String triggerLabelCrowds = 'Crowds';

  // ============================================================
  // ONBOARDING - MASCOT INTRO (Screen 1.4)
  // ============================================================

  /// Mascot name
  static const String mascotName = 'Rafiq';

  /// Mascot greeting prefix
  static const String mascotGreetingPrefix = 'Hi ';

  /// Mascot greeting suffix
  static const String mascotGreetingSuffix = '!';

  /// Mascot introduction
  static const String mascotIntroduction = "I'm Rafiq.";

  /// Mascot help text
  static const String mascotHelpText = "I'm here to help you explore.";

  /// High five button text
  static const String highFiveButton = 'High Five!';

  // ============================================================
  // ONBOARDING - COMPLETION
  // ============================================================

  /// Completion dialog title
  static const String completionTitle = 'Welcome to Spectra! 🎉';

  /// Completion message prefix
  static const String completionMessagePrefix = 'Great job, ';

  /// Completion message middle
  static const String completionMessageMiddle =
      '!\n\nYour profile has been created with ';

  /// Completion message suffix
  static const String completionMessageSuffix = '.';

  /// Default buddy fallback
  static const String defaultBuddy = 'your buddy';

  /// Start over button text
  static const String startOverButton = 'Start Over';

  // ============================================================
  // COMMON STRINGS
  // ============================================================

  /// Continue button text
  static const String continueButton = 'Continue';

  /// Default child name fallback
  static const String defaultChildName = 'You';

  /// Default friend name fallback
  static const String defaultFriendName = 'Friend';

  /// Unknown character fallback
  static const String unknownCharacter = '?';

  // ============================================================
  // EMOJI STRINGS
  // ============================================================

  /// Turtle emoji (slow speed)
  static const String emojiTurtle = '🐢';

  /// Rabbit emoji (fast speed)
  static const String emojiRabbit = '🐇';

  // ============================================================
  // ASSET URLS
  // ============================================================

  /// Avatar image URL - Leo
  static const String avatarUrlLeo =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAI1SpnIsf-XF6pMwaBvWHLGmx43y84MqbMEDqMx5TLT6DDi6BPahrdi4cOObZT7mHw7OFZ6h41n2ohuLdpKFPzgmjUXSoFJka_LQ6kJuptl3ZWuAgYmj7WkCtSXzgXz3BHtvtB_Ewmy3gC3z7XZqle-z1kEtsCMbp8GLg5wN1tmcEoNn8Yu0x9WoIjnEGOHPTK5M0UgIYmOUzlSxwTUzWuyByOj8MVX04UB9tpFaZvR9VpP-JlvlG4bzl07RdhP5RHjUbKX5ExPuE';

  /// Avatar image URL - Trunks
  static const String avatarUrlTrunks =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD5u2jpP0HR9esMTBbiJygq3ZvcYjfWSAGKgbTCNPBRzC5IQIkNx1HSClJBQhfQkMPwfYpGlYs7fol558ZQAvA6E1luDFymW1hPCUCW0ATQ36h_IRiFfPsKJthHdvxi21qSApC_EkeJeibwnbHpNpVg86SmNfPW-y9IWSllaS4hCQnMZDqaMZqTEzojCQa-8A_dqt2xAbycZ8yc7L8Sypv4jxXWHcIgoKbd_YCd1l2BIeJ0vqW7BkRUmVIQPfiFSx8MSJI8pHk67YA';

  /// Avatar image URL - Hops
  static const String avatarUrlHops =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuBs3xiqSXyppkovdvFSf-DFAdc31YkHMNy_AkY2yNGliO_IUKFZkaxRwhpktTZP3CSuvWVgsVPFqS6VaIPOpZ44dm8FCe9utzOb0tjLIwJf7TEEsCS7q3wr5FNmPCy9zns_muCwO2H9HSZtsv2GctUxgYsvn2qa2AkXhVoMgEAU9eF_G07fHzcq94JImFK198VBfl0OgNPmSLE-mIOIUh6xRTyOxHcwVOW0FanVuMNOHUeZtxTgGIn_MTyUOtXdYl7HVq16gcy0J-c';

  /// Mascot image URL - Rafiq
  static const String mascotUrlRafiq =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuA56eKSlQzjlnhvEyLKgiU9WDTCSYjzM_9c4MSzbqTo8_oMjzAtTcQPHa6c7EEFPQ0pUAhDjv-uws7pDbALjIn5fPL0lGJYW502afvMwprA767u7UjvxfvpEypKUUGlMFKAgPymkBPmQHVYZzpTfIgAt1RJBSS1xm3TKJSfFvLp_Tc981gDHGterNF74EVJho6uFeHZrLb2Rfcwzy5-O-YZ5qpwhm8D-aLH5gpk1jLK2_qxomMl7uHCBP3G8VOeFQX7ckvQPhRZXjc';

  // ============================================================
  // HELPER METHODS
  // ============================================================

  /// Generate greeting message with name
  /// Example: "Hi Alex!"
  static String getGreeting(String name) {
    return '$mascotGreetingPrefix$name$mascotGreetingSuffix';
  }

  /// Generate sensory profile title with name
  /// Example: "What bothers Alex the most?"
  static String getSensoryProfileTitle(String name) {
    return '$sensoryProfileTitlePrefix$name$sensoryProfileTitleSuffix';
  }

  /// Generate completion message
  /// Example: "Great job, Alex!\n\nYour profile has been created with Trunks."
  static String getCompletionMessage(String childName, String? buddyName) {
    final buddy = buddyName ?? defaultBuddy;
    return '$completionMessagePrefix$childName$completionMessageMiddle$buddy$completionMessageSuffix';
  }
}
