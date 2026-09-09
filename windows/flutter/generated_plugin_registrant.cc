//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <cindel_flutter_libs/cindel_flutter_libs_plugin.h>
#include <proxy_setting_windows/proxy_setting_windows.h>
#include <screen_retriever_windows/screen_retriever_windows_plugin_c_api.h>
#include <window_manager/window_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CindelFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CindelFlutterLibsPlugin"));
  ProxySettingWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ProxySettingWindows"));
  ScreenRetrieverWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverWindowsPluginCApi"));
  WindowManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WindowManagerPlugin"));
}
