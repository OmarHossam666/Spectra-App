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

  // ============================================================
  // LOGIN SCREEN STRINGS
  // ============================================================

  /// Login welcome title
  static const String loginWelcomeTitle = 'Welcome Back!';

  /// Login subtitle
  static const String loginSubtitle = 'Who is using the app?';

  /// Child profile - tap hint
  static const String loginChildHint = 'Tap to play';

  /// Parent profile - subtitle
  static const String loginParentHint = 'Settings & Reports';

  /// Parent profile label
  static const String loginGuardianLabel = 'Guardian';

  /// Rafiq greeting for login
  static const String loginRafiqGreeting = 'Hello! Who are you today?';

  /// Child pattern login title
  static const String loginPatternTitle = 'Tap your secret pictures';

  /// Pattern hint text
  static const String loginPatternHint = 'Pick your secret pictures';

  /// Rafiq pattern hint
  static const String loginRafiqPatternHint = 'Follow the stars!';

  /// Pattern error message
  static const String loginPatternError = 'Oops! Try again.';

  /// Clear pattern button
  static const String loginClearPattern = 'Start over';

  /// Guardian access title
  static const String loginGuardianAccess = 'Guardian Access';

  /// Guardian verify prompt
  static const String loginVerifyPrompt = 'Please verify it\'s you';

  /// Biometric prompt
  static const String loginBiometricPrompt = 'Touch sensor to unlock';

  /// Huawei ID button
  static const String loginHuaweiId = 'Sign in with Huawei ID';

  /// PIN code link
  static const String loginUsePinCode = 'Use PIN code instead';

  /// PIN dialog title
  static const String loginEnterPin = 'Enter PIN';

  /// PIN hint
  static const String loginPinHint = '4-digit PIN';

  /// Login success child
  static String getLoginSuccessChild(String name) => 'Welcome back, $name!';

  /// Login success guardian
  static const String loginSuccessGuardian = 'Guardian access granted';

  /// Help button text
  static const String loginHelpButton = 'I need help';

  /// Help banner text
  static const String loginHelpBanner = 'Help';

  /// Help dialog title
  static const String loginHelpTitle = 'Need Help?';

  /// Help dialog content
  static const String loginHelpContent =
      'Tap on your picture to start.\n\nIf you need assistance, ask a trusted adult for help.';

  /// Help dialog confirm
  static const String loginHelpConfirm = 'Got it!';

  /// Pattern tap hint
  static const String loginPatternTapHint = 'Tap:';

  /// Parent login title
  static const String loginParentTitle = 'Parent Login';

  /// Biometric verifying state
  static const String loginBiometricVerifying = 'Verifying...';

  /// Cancel button
  static const String cancel = 'Cancel';

  /// Confirm button
  static const String confirm = 'Confirm';

  /// Or divider text
  static const String orDivider = 'or';

  /// Child greeting prefix
  static const String loginChildGreetingPrefix = 'Hi, ';

  /// Child greeting suffix
  static const String loginChildGreetingSuffix = '!';

  /// Generate child greeting
  static String getChildGreeting(String name) =>
      '$loginChildGreetingPrefix$name$loginChildGreetingSuffix';

  // ============================================================
  // ASSET PATHS
  // ============================================================

  /// Rafiq mascot asset path
  static const String assetRafiqMascot = 'assets/images/rafiq_mascot.png';

  // ============================================================
  // HOME SCREEN STRINGS
  // ============================================================

  /// Home - Now label
  static const String homeNow = 'NOW';

  /// Home - Next label
  static const String homeNext = 'NEXT';

  /// Home - All done message
  static const String homeAllDone = 'All done for now!';

  /// Home - Explore section title
  static const String homeExplore = 'Explore';

  /// Home - Talk module
  static const String homeTalk = 'Talk to Me';

  /// Home - Feelings module
  static const String homeFeelings = 'How I Feel';

  /// Home - Learn module
  static const String homeLearn = "Let's Learn";

  /// Home - Play module
  static const String homePlay = 'Play Time';

  /// Home - Calm Space module
  static const String homeCalmSpace = 'Calm Room';

  /// Home - Calm Space subtitle
  static const String homeCalmSpaceSubtitle = 'Relax and breathe';

  /// Home - SOS dialog title
  static const String homeSosTitle = 'Need Help?';

  /// Home - SOS dialog content
  static const String homeSosContent =
      'This will notify your parent or guardian that you need help.';

  /// Home - SOS confirm button
  static const String homeSosConfirm = 'Get Help';

  /// Bottom nav - Home
  static const String navHome = 'Home';

  /// Bottom nav - Chat
  static const String navChat = 'Chat';

  /// Bottom nav - Settings
  static const String navSettings = 'Settings';

  // ============================================================
  // HOME SCREEN - TIME BASED STRINGS
  // ============================================================

  /// Morning subtitle
  static const String homeMorningSubtitle = 'Ready for today?';

  /// Afternoon subtitle
  static const String homeAfternoonSubtitle = 'Keep up the great work!';

  /// Evening subtitle
  static const String homeEveningSubtitle = 'Almost there!';

  /// Night subtitle
  static const String homeNightSubtitle = 'Time to rest soon';

  /// Rafiq morning message
  static const String homeRafiqMorning = 'Good morning! Ready for today?';

  /// Rafiq afternoon message
  static const String homeRafiqAfternoon = 'Having a great day!';

  /// Rafiq evening message
  static const String homeRafiqEvening = 'Almost done for today!';

  /// Rafiq night message
  static const String homeRafiqNight = 'Time to wind down!';

  // ============================================================
  // HOME SCREEN - DEMO DATA STRINGS
  // ============================================================

  /// Demo activity - Breakfast
  static const String homeActivityBreakfast = 'Breakfast';

  /// Demo activity - Breakfast ID
  static const String homeActivityBreakfastId = 'breakfast';

  /// Demo activity - Breakfast subtitle
  static const String homeActivityBreakfastSubtitle = '10 mins left';

  /// Demo activity - School Bus
  static const String homeActivitySchoolBus = 'School Bus';

  /// Demo activity - School Bus ID
  static const String homeActivitySchoolBusId = 'school_bus';

  /// Demo child avatar URL
  static const String homeChildAvatarUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD2uUb4GPvFXXLHypw7H4sAiT4NZEIfgXUZcfXBjoIFKxCwgOoXgluc_x1iZAbsgy860ucG6uCpIFaN5gK46JTSyBJnvzJvOAsDe_BxG6_Qb7Vt5ee8ExC2XLvnaZj9_q1O3VZeWbt72QAE_TY_hINeGX5GsE201KzhvRNr2LCHCe9wInB09JEqsINisfRx_u2jMtl0IMC2-ybErWLgha61MYDA08GsMXIsT_NP2IvY5An3pW4o2cjtmRNdWj4o3AgHk7dyzICz_9A';
}
