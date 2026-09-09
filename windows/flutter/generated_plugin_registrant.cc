//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <cindel_flutter_libs/cindel_flutter_libs_plugin.h>
#include <flutter_sys_proxy/flutter_sys_proxy_plugin.h>
#include <screen_retriever_windows/screen_retriever_windows_plugin_c_api.h>
#include <window_manager/window_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CindelFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CindelFlutterLibsPlugin"));
  FlutterSysProxyPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterSysProxyPlugin"));
  ScreenRetrieverWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverWindowsPluginCApi"));
  WindowManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowManagerPlugin"));
}
