import 'package:envied/envied.dart';
part 'env.g.dart';


@Envied(path: '.env')
abstract class Env {
    @EnviedField(varName: 'API_URL',obfuscate: true)
    static final String apiUrl = _Env.apiUrl;
    @EnviedField(varName: 'TOKEN',obfuscate: true)
    static final String token = _Env.token;
    @EnviedField(varName:'ITEM_ID',obfuscate: true)
    static final int itemId= _Env.itemId;
}