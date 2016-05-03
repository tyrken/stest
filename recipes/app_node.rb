#
# Cookbook Name:: stest
# Recipe:: app_node
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'stest::build_app'
include_recipe 'stest::install_app_service'
