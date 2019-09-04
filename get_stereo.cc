// Copyright 2018 Slightech Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
#include <opencv2/highgui/highgui.hpp>

#include "mynteye/api/api.h"
#include<iostream>

MYNTEYE_USE_NAMESPACE

int main(int argc, char *argv[]) {
  auto &&api = API::Create(argc, argv);
  if (!api) return 1;

  bool ok;
  // long int im_num = 0;
  long int im_num = 1385030208;//0.1s
  char name[200];
  auto &&request = api->SelectStreamRequest(&ok);
  if (!ok) return 1;
  api->ConfigStreamRequest(request);
  api->SetDisparityComputingMethodType(DisparityComputingMethod::BM);
  api->Start(Source::VIDEO_STREAMING);

  // cv::namedWindow("frame");

  while (true) {
    api->WaitForStreams();

    auto &&left_data = api->GetStreamData(Stream::LEFT);
    auto &&right_data = api->GetStreamData(Stream::RIGHT);

    cv::Mat img;
    if (!left_data.frame.empty() && !right_data.frame.empty()) {
      cv::hconcat(left_data.frame, right_data.frame, img);
      // cv::imshow("frame", img);
      cv::imshow("left", left_data.frame);
      cv::imshow("right", right_data.frame);
      
    }

    char key = static_cast<char>(cv::waitKey(1));
    if (key == 's'){
      sprintf(name ,"%s%d%s%s", "/home/matt/public/tmp/cam0/", im_num, "000000000", ".png");
      cv::imwrite(name, left_data.frame);

      sprintf(name ,"%s%d%s%s", "/home/matt/public/tmp/cam1/", im_num, "000000000", ".png");      
      cv::imwrite(name, right_data.frame);

      im_num++;

    }
    if (key == 27 || key == 'q' || key == 'Q') {  // ESC/Q
      break;
    }
  }

  api->Stop(Source::VIDEO_STREAMING);
  return 0;
}
