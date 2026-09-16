

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { TvpSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('ContentEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when TVP_TEST_LIVE=TRUE.
  afterEach(liveDelay('TVP_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = TvpSDK.test()
    const ent = testsdk.Content()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.TVP_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'content.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[],"name":"content","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"example":93573158,"kind":"param","name":"content_id","orig":"content_id","reqd":true,"type":"`$INTEGER`","index$":0}]},"contract":{"id":"GET /tokenizer/token/{content_id}","json":"{\"operationId\":\"getContentInfo\",\"parameters\":[{\"description\":\"The unique identifier for the TV content/program\",\"in\":\"path\",\"name\":\"content_id\",\"required\":true,\"schema\":{\"example\":93573158,\"format\":\"int64\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"content_id\":{\"description\":\"The unique identifier of the content\",\"example\":93573158,\"type\":\"integer\"},\"description\":{\"description\":\"Description of the content\",\"type\":\"string\"},\"metadata\":{\"additionalProperties\":true,\"description\":\"Additional metadata about the content\",\"type\":\"object\"},\"title\":{\"description\":\"Title of the TV program or show\",\"type\":\"string\"},\"token\":{\"description\":\"Access token for the content\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Successful response with content information\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"Invalid content_id parameter\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Bad Request - Invalid content ID format\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"Content not found\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Content not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"example\":\"Internal server error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal Server Error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/tokenizer/token/{content_id}","segments":[{"lit":"tokenizer"},{"lit":"token"},{"var":"content_id"}],"select":{"exist":["content_id"]},"transform":{"req":"`reqdata`","res":"`body.metadata`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[["token"]]},"key$":"content","name__orig":"content","Name":"Content","name_":"content","name-":"content","NAME":"CONTENT","index$":0}, {"active":true,"entity":"content","key$":"BasicContentFlow","kind":"basic","name":"BasicContentFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"content_ref01","srcdatavar":"content_ref01_data","suffix":"_dt0"},"match":{"id":"content01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-content_ref01"}}],"index$":0}]}, 'Content')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let content_ref01_data = Object.values(setup.data.existing.content)[0] as any

    // LOAD: skipped — no entity id field and load requires path params.
    // Entity-var is declared here so later flow steps still compile.
    const content_ref01_ent = client.Content()


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/content/ContentTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = TvpSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['content01','content02','content03','token01','token02','token03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'TVP_TEST_CONTENT_ENTID': idmap,
    'TVP_TEST_LIVE': 'FALSE',
    'TVP_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['TVP_TEST_CONTENT_ENTID']

  const live = 'TRUE' === env.TVP_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['TVP_TEST_CONTENT_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new TvpSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.TVP_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
