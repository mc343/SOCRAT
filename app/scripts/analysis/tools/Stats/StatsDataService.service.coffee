'use strict'

BaseModuleDataService = require 'scripts/BaseClasses/BaseModuleDataService.coffee'

module.exports = class StatsDataService extends BaseModuleDataService
  @inject '$q', 'app_analysis_stats_msgService'

  # requires renaming message service injection to @msgService
  initialize: () ->
    @msgManager = @app_analysis_stats_msgService
    @getDataRequest = @msgManager.getMsgList().outgoing[0]
    @getDataResponse = @msgManager.getMsgList().incoming[0]

  inferDataTypes: (data, cb) ->
    @post(@msgManager.getMsgList().outgoing[1], @msgManager.getMsgList().incoming[1], data).then (resp) =>
      cb resp
