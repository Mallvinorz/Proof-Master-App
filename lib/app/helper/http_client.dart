import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:proofmaster/app/helper/interceptor.dart';

final httpClientWithInterceptor = InterceptedClient.build(
  interceptors: [AuthInterceptor()],
  requestTimeout: const Duration(seconds: 60),
);
