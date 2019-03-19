// Copyright (C) 2019 Moxa Inc. All rights reserved.
// SPDX-License-Identifier: Apache-2.0

#pragma once

#include "mqtt/Client.hpp"
#include "NetworkConnection.hpp"

namespace awsiotsdk {
    namespace samples {
        class MoxaSampleMqtt {
        protected:
            std::shared_ptr<NetworkConnection> p_network_connection_;
            std::shared_ptr<MqttClient> p_iot_client_;

            ResponseCode SubscribeCallback(util::String topic_name,
                                           util::String payload,
                                           std::shared_ptr<mqtt::SubscriptionHandlerContextData> p_app_handler_data);
            ResponseCode DisconnectCallback(util::String topic_name,
                                            std::shared_ptr<DisconnectCallbackContextData> p_app_handler_data);
            ResponseCode ReconnectCallback(util::String client_id,
                                           std::shared_ptr<ReconnectCallbackContextData> p_app_handler_data,
                                           ResponseCode reconnect_result);
            ResponseCode ResubscribeCallback(util::String client_id,
                                             std::shared_ptr<ResubscribeCallbackContextData> p_app_handler_data,
                                             ResponseCode resubscribe_result);
            ResponseCode PublishMqtt(util::String &payload, uint16_t &packet_id);
            ResponseCode UnsubscribeMqtt(void);
            ResponseCode SubscribeMqtt(void);
            ResponseCode DisconnectMqtt(void);
            ResponseCode ConnectMqtt(void);
            ResponseCode CreateMqtt(void);
            ResponseCode InitializeNetwork(void);

        public:
            ResponseCode RunSample(void);
        };
    }
}
