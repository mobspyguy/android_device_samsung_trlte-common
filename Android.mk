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
