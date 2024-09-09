import 'package:shared_preferences/shared_preferences.dart';

const ONBOARD_STATUS = 'onboard_status';
const AUTH_TOKEN = 'auth_token';
const ROLE = 'role';

final Future<SharedPreferencesWithCache> pref =
    SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
            // This cache will only accept the key 'counter'.
            allowList: <String>{ONBOARD_STATUS, AUTH_TOKEN, ROLE}));
