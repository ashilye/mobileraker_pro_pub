/*
 * Copyright (c) 2023. Patrick Schmidt.
 * All rights reserved.
 */

import 'dart:async';

import 'package:common/data/dto/job_queue/job_queue_event.dart';
import 'package:common/data/dto/job_queue/job_queue_status.dart';
import 'package:common/data/dto/jrpc/rpc_response.dart';
import 'package:common/exceptions/mobileraker_exception.dart';
import 'package:common/network/jrpc_client_provider.dart';
import 'package:common/network/json_rpc_client.dart';
import 'package:common/service/selected_machine_service.dart';
import 'package:common/util/extensions/ref_extension.dart';
import 'package:common/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'job_queue_service.g.dart';

@riverpod
JobQueueService jobQueueService(JobQueueServiceRef ref, String machineUUID) {
  return JobQueueService(ref, machineUUID);
}

@riverpod
Stream<JobQueueStatus> jobQueue(JobQueueRef ref, String machineUUID) async* {
  ref.keepAlive();
  yield JobQueueStatus(queueState: QueueState.paused);
}

@riverpod
JobQueueService jobQueueServiceSelected(JobQueueServiceSelectedRef ref) {
  return ref.watch(jobQueueServiceProvider(ref.watch(selectedMachineProvider).valueOrNull!.uuid));
}

@riverpod
Stream<JobQueueStatus> jobQueueSelected(JobQueueSelectedRef ref) async* {
  try {
    var machine = await ref.watch(selectedMachineProvider.future);
    if (machine == null) return;

    yield* ref.watchAsSubject(jobQueueProvider(machine.uuid));
  } on StateError catch (_) {
    // Just catch it. It is expected that the future/where might not complete!
  }
}

/// The JobQueueService is responsible for all interactions with the job API of Moonraker.
/// For more information check out
/// 1. https://moonraker.readthedocs.io/en/latest/web_api/#job-queue-apis
class JobQueueService {
  JobQueueService(AutoDisposeRef ref, String machineUUID);


  Stream<JobQueueEvent> get queueChagendEventStream => Stream.empty();


  Future<JobQueueStatus> queueStatus() async {
    logger.i('Queue status request...');
    return JobQueueStatus(queueState: QueueState.ready);
  }

  Future<JobQueueStatus> enqueueJobs(List<String> files, [bool reset = false]) async {
    logger.i('Trying to enqueue files $files...');
    return JobQueueStatus(queueState: QueueState.ready);
  }

  Future<JobQueueStatus> enqueueJob(String file, [bool reset = false]) async {
    logger.i('Trying to enqueue file $file...');
    return enqueueJobs([file], reset);
  }

  Future<JobQueueStatus> dequeueJobs(List<String> jobIds) async {
    logger.i('Trying to dequeue files $jobIds...');
    return JobQueueStatus(queueState: QueueState.ready);
  }

  Future<JobQueueStatus> dequeueJob(String jobId) async {
    logger.i('Trying to enqueue file $jobId...');
    return dequeueJobs([jobId]);
  }

  Future<JobQueueStatus> pauseQueue() async {
    logger.i('Trying to pause queue...');
   return JobQueueStatus(queueState: QueueState.paused);
  }

  Future<JobQueueStatus> startQueue() async {
    logger.i('Trying to start queue...');
    return JobQueueStatus(queueState: QueueState.starting);
  }
}
