import json
import cv2
from dotenv import load_dotenv
import requests

import os

from sklearn.feature_extraction import image

LIMIT_PX = 2048
LIMIT_BYTE = 2048*2048  # 1MB / 기존 LIMIT_BYTE 값은 1024*1024 였는데 픽셀이 너무 깨져서 2048로 수정했는데 크기가 1mb 를 넘지 않아 적용된듯 함
LIMIT_BOX = 40


def kakao_ocr_resize(image_path: str):
    """
    ocr detect/recognize api helper
    ocr api의 제약사항이 넘어서는 이미지는 요청 이전에 전처리가 필요.

    pixel 제약사항 초과: resize
    용량 제약사항 초과  : 다른 포맷으로 압축, 이미지 분할 등의 처리 필요. (예제에서 제공하지 않음)

    :param image_path: 이미지파일 경로
    :return:
    """
    

    image = cv2.imread(image_path)
    height, width, _ = image.shape

    if LIMIT_PX < height or LIMIT_PX < width:
        ratio = float(LIMIT_PX) / max(height, width)
        image = cv2.resize(image, None, fx=ratio, fy=ratio)
        height, width, _ = height, width, _ = image.shape

        cv2.imwrite(image_path, image)

        return image_path
    return image_path


def kakao_ocr(image_path: str, appkey: str):
    """
    OCR api request example
    :param image_path: 이미지파일 경로
    :param appkey: 카카오 앱 REST API 키
    """
    API_URL = 'https://dapi.kakao.com/v2/vision/text/ocr'


    headers = {'Authorization': 'KakaoAK {}'.format(appkey)}

    image = cv2.imread(image_path)
    jpeg_image = cv2.imencode(".jpg", image)[1]
    data = jpeg_image.tobytes()


    return requests.post(API_URL, headers=headers, files={"image": data})


def main():

    # 보안상 API_KEY 를 환경변수 처리해주었다.
    load_dotenv()
    API_KEY = os.environ.get("API_KEY")
    appkey = API_KEY

    # image folder
    image_folder_path = "/Users/heyon/Desktop/JAY/Jay-Thomas-code/Project/ETOOS_OCR/image"
    image_folder_list = os.listdir(image_folder_path)
    # 현재 image_folder 배열형태 - 순서대로 나열되어있는 형태
    image_folder_list.sort()    
    
    # 이름 변경된 사진이 저장될 폴더
    saved_image_folder_path = "/Users/heyon/Desktop/JAY/Jay-Thomas-code/Project/ETOOS_OCR/saved_image"  

    # 파일 네이밍 시 접두사 부분에 날짜를 적어야했으므로 date 를 input 받아 파일명에 추가
    date = input("이름 앞에 붙을 날짜를 입력해주세요(ex. 20220701) : " )

    for image in range(1, len(image_folder_list), 2) : 
        
        # image file 의 경로가 들어와야함
        image_path = f"{image_folder_path}/{image_folder_list[image]}"  
        # print(os.listdir(image_folder_path))
        # print(f"image_path : {image_path}")
        resize_impath = kakao_ocr_resize(image_path)
        
        if resize_impath is not None:
            image_path = resize_impath

        output = kakao_ocr(image_path, appkey).json()
        # print("[OCR] output:\n{}\n".format(json.dumps(output, sort_keys=True, indent=2, ensure_ascii=False)))

        # print(f"len : {len(output['result'])}")
        # 5번 째 property 가 이름 value을 갖고있음
        OCR_result = output['result'][5] 
        
        for j in range(len(output['result'])) :
            print("다음 다음 다음 다음 다음")
            name_position = output['result'][j]['recognition_words'][0]

            if name_position == "이름" :
                
                
            

        
        # student_name = OCR_result['recognition_words'][0]
        

        # 첫 번째 파일의 이름을 json 파일에서 추출한 student_name 으로 선언하고
        # 이어서 두 번째 파일 이름을 첫 번째 파일에서 (1)을 더한 이름으로 선언
        os.rename((f"{image_folder_path}/{image_folder_list[image]}"), f"{saved_image_folder_path}/{date} {student_name}.jpg")
        os.rename((f"{image_folder_path}/{image_folder_list[image+1]}"), f"{saved_image_folder_path}/{date} {student_name}(1).jpg")


if __name__ == "__main__":
    main()
