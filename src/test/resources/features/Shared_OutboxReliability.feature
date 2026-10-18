@shared @outbox
Feature: Transactional Outbox Pattern and Event Delivery Reliability
  As a microservice in the SmartDrop ecosystem
  I want domain events to be persisted atomically in the Outbox table and dispatched asynchronously
  So that eventual consistency is guaranteed even during temporary message broker outages.

  Background:
    Given the OutboxPublisherService is configured with maximum retry threshold of 5 attempts

  Scenario: Successful publication of pending outbox messages
    Given an outbox event "TankCriticalLeakDetected" exists with status "PENDING" and retryCount 0
    When the OutboxPublisherService executes the scheduled relay cycle
    Then the event status should transition to "PROCESSED"
    And the processedAt timestamp should be recorded

  Scenario: Exponential backoff retry and dead-letter transition after max failures
    Given an outbox event "TelemetryAnomaly" exists with status "PENDING" and retryCount 4
    When the message broker rejects the delivery on the 5th attempt
    Then the event status should transition to "FAILED"
    And the retryCount should reach 5
