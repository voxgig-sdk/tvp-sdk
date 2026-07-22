package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewContentEntityFunc func(client *TvpSDK, entopts map[string]any) TvpEntity

