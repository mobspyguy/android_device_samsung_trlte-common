#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter trlte trltecan trltedt trlteduos trltespr trltetmo trlteusc trltevzw trltexx tblte tbltecan tbltedt tblteduos tbltespr tbltetmo tblteusc tbltevzw tbltexx,$(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif

include $(CLEAR_VARS)
NFC_FILES := \
    libnfc-sec-hal.conf

NFC_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/,$(notdir $(NFC_FILES)))
$(NFC_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Nfc sec-hal conf: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/etc/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(NFC_SYMLINKS)

include $(CLEAR_VARS)
CAMVERS_FILES := \
    H16UL_s5k2p2xx_module_info.xml H16US_imx240_module_info.xml

CAMVERS_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/,$(notdir $(CAMVERS_FILES)))
$(CAMVERS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Camera module version link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/etc/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMVERS_SYMLINKS)

include $(CLEAR_VARS)
CAMDATA_SYMLINK := $(TARGET_OUT)/cameradata
$(CAMDATA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Cameradata symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/cameradata $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMDATA_SYMLINK)

include $(CLEAR_VARS)
CAMLIB_FILES := \
    libarcsoft_nighthawk.so \
    libliveframework.so \
    libmmcamera2_stats_algorithm.so \
    libmmcamera_cac3_lib.so \
    libmmcamera_fidelix_eeprom.so \
    libmmcamera_interface.so \
    libmmipl.so \
    libmmjpeg_interface.so \
    libmmjpeg.so \
    libmmqjpeg_codec.so \
    libqomx_core.so \
    libqomx_jpegenc.so \
    libvdis.so \
    H16UL_libTsAe.so \
    H16UL_libTsAf.so \
    H16UL_libTs_J_Accm.so \
    H16UL_libTs_J_Awb.so \
    H16UL_libchromatix_s5k2p2xx_default_video.so \
    H16UL_libchromatix_s5k2p2xx_foodmode_cpp.so \
    H16UL_libchromatix_s5k2p2xx_golfshot.so \
    H16UL_libchromatix_s5k2p2xx_golfshot_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_liveshot_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_preview.so \
    H16UL_libchromatix_s5k2p2xx_hdr_preview_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_preview_lls_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_uhd_video.so \
    H16UL_libchromatix_s5k2p2xx_hdr_uhd_video_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_video.so \
    H16UL_libchromatix_s5k2p2xx_hdr_video_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_zslshot_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hdr_zslshot_lls_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hfr_1080p_b.so \
    H16UL_libchromatix_s5k2p2xx_hfr_1080p_b_cpp.so \
    H16UL_libchromatix_s5k2p2xx_hfr_120.so \
    H16UL_libchromatix_s5k2p2xx_hfr_120_cpp.so \
    H16UL_libchromatix_s5k2p2xx_liveshot_cpp.so \
    H16UL_libchromatix_s5k2p2xx_pip.so \
    H16UL_libchromatix_s5k2p2xx_preview.so \
    H16UL_libchromatix_s5k2p2xx_preview_cpp.so \
    H16UL_libchromatix_s5k2p2xx_preview_drama_cpp.so \
    H16UL_libchromatix_s5k2p2xx_preview_lls_cpp.so \
    H16UL_libchromatix_s5k2p2xx_preview_panorama_cpp.so \
    H16UL_libchromatix_s5k2p2xx_preview_pip_cpp.so \
    H16UL_libchromatix_s5k2p2xx_shotmode_preview.so \
    H16UL_libchromatix_s5k2p2xx_shotmode_preview_cpp.so \
    H16UL_libchromatix_s5k2p2xx_shotmode_zslshot_cpp.so \
    H16UL_libchromatix_s5k2p2xx_uhd_video.so \
    H16UL_libchromatix_s5k2p2xx_uhd_video_cpp.so \
    H16UL_libchromatix_s5k2p2xx_video_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_2_4_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso100_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso200_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso400_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso800_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_2_4_lls_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_iso100_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_iso200_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_iso400_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_iso800_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_lls_cpp.so \
    H16UL_libchromatix_s5k2p2xx_zslshot_pip_cpp.so \
    H16US_libTsAe.so \
    H16US_libTsAf.so \
    H16US_libTs_J_Accm.so \
    H16US_libTs_J_Awb.so \
    H16US_libchromatix_imx240_default_video.so \
    H16US_libchromatix_imx240_foodmode_cpp.so \
    H16US_libchromatix_imx240_golfshot.so \
    H16US_libchromatix_imx240_golfshot_cpp.so \
    H16US_libchromatix_imx240_hdr_liveshot_cpp.so \
    H16US_libchromatix_imx240_hdr_preview.so \
    H16US_libchromatix_imx240_hdr_preview_cpp.so \
    H16US_libchromatix_imx240_hdr_preview_lls_cpp.so \
    H16US_libchromatix_imx240_hdr_uhd_video.so \
    H16US_libchromatix_imx240_hdr_uhd_video_cpp.so \
    H16US_libchromatix_imx240_hdr_video.so \
    H16US_libchromatix_imx240_hdr_video_cpp.so \
    H16US_libchromatix_imx240_hdr_zslshot_cpp.so \
    H16US_libchromatix_imx240_hdr_zslshot_lls_cpp.so \
    H16US_libchromatix_imx240_hfr_1080p_b.so \
    H16US_libchromatix_imx240_hfr_1080p_b_cpp.so \
    H16US_libchromatix_imx240_hfr_120.so \
    H16US_libchromatix_imx240_hfr_120_cpp.so \
    H16US_libchromatix_imx240_liveshot_cpp.so \
    H16US_libchromatix_imx240_pip.so \
    H16US_libchromatix_imx240_preview.so \
    H16US_libchromatix_imx240_preview_cpp.so \
    H16US_libchromatix_imx240_preview_drama_cpp.so \
    H16US_libchromatix_imx240_preview_lls_cpp.so \
    H16US_libchromatix_imx240_preview_panorama_cpp.so \
    H16US_libchromatix_imx240_preview_pip_cpp.so \
    H16US_libchromatix_imx240_shotmode_preview.so \
    H16US_libchromatix_imx240_shotmode_preview_cpp.so \
    H16US_libchromatix_imx240_shotmode_zslshot_cpp.so \
    H16US_libchromatix_imx240_uhd_video.so \
    H16US_libchromatix_imx240_uhd_video_cpp.so \
    H16US_libchromatix_imx240_video_cpp.so \
    H16US_libchromatix_imx240_zslshot_2_4_cpp.so \
    H16US_libchromatix_imx240_zslshot_2_4_iso100_cpp.so \
    H16US_libchromatix_imx240_zslshot_2_4_iso200_cpp.so \
    H16US_libchromatix_imx240_zslshot_2_4_iso400_cpp.so \
    H16US_libchromatix_imx240_zslshot_2_4_iso800_cpp.so \
    H16US_libchromatix_imx240_zslshot_2_4_lls_cpp.so \
    H16US_libchromatix_imx240_zslshot_cpp.so \
    H16US_libchromatix_imx240_zslshot_iso100_cpp.so \
    H16US_libchromatix_imx240_zslshot_iso200_cpp.so \
    H16US_libchromatix_imx240_zslshot_iso400_cpp.so \
    H16US_libchromatix_imx240_zslshot_iso800_cpp.so \
    H16US_libchromatix_imx240_zslshot_lls_cpp.so \
    H16US_libchromatix_imx240_zslshot_pip_cpp.so \
    libTsAe.so \
    libTsAf.so \
    libTs_J_Accm.so \
    libTs_J_Awb.so

CAMLIB_SYMLINKS := $(addprefix $(TARGET_OUT)/lib/,$(notdir $(CAMLIB_FILES)))
$(CAMLIB_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Camera module version link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMLIB_SYMLINKS)

include $(CLEAR_VARS)
QMUX_CONFIG_SYMLINK := $(TARGET_OUT_ETC)/data
$(QMUX_CONFIG_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "qmuxd config dir symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/etc/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(QMUX_CONFIG_SYMLINK)
