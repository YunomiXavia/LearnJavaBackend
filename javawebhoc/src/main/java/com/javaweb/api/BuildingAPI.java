package com.javaweb.api;

import com.javaweb.Beans.ErrorResponseDTO;
import customexception.FieldRequiredException;
import org.springframework.web.bind.annotation.*;

import com.javaweb.Beans.BuildingDTO;

import java.util.ArrayList;
import java.util.List;

// Có annotation thì nó mới hiểu là web api không thì chỉ là 1 class bình thường
@RestController
public class BuildingAPI {
//    @RequestMapping(value = "/api/building/", method = RequestMethod.GET)
    @GetMapping(value="/api/building/")
    // @Controller thì mới cần có @ResponseBody
//    @ResponseBody
//     Thường phần tìm kiếm sẽ đẩy lên param
//     Biến name hứng dữ liệu từ param
//    public List<BuildingDTO> getBuilding(@RequestParam(value="name", required = false) String nameBuilding, @RequestParam(value="numberOfBasement", required = false) Integer numberOfBasement, @RequestParam(value = "ward", required = false) String ward) {
//        // Xử lý dưới DB xong rồi
////        BuildingDto result = new BuildingDto();
////        result.setName(nameBuilding);
////        result.setNumberOfBasement(numberOfBasement);
////        result.setWard(ward);
////        return result;
////        System.out.println(nameBuilding + " " + numberOfBasement);
//        List<BuildingDTO> listBuildings = new ArrayList<>();
//        BuildingDTO buildingDTO1 = new BuildingDTO();
//        buildingDTO1.setName("ABC Building");
//        buildingDTO1.setNumberOfBasement(3);
//        buildingDTO1.setWard("Tan Mai");
//
//        BuildingDTO buildingDTO2 = new BuildingDTO();
//        buildingDTO2.setName("ACM Tower");
//        buildingDTO2.setNumberOfBasement(2);
//        buildingDTO2.setWard("Da Cao");
//
//        listBuildings.add(buildingDTO1);
//        listBuildings.add(buildingDTO2);
//        return listBuildings;
//    }


//    @GetMapping(value="/api/building/")
//    public Object getBuilding(@RequestParam(value="name", required = false) String nameBuilding, @RequestParam(value="numberOfBasement", required = false) Integer numberOfBasement, @RequestParam(value = "ward", required = false) String ward) {
//        // Xử lý dưới DB xong rồi
//        try {
//            // Lỗi 200
//            // Phải code ntn để kể cả lỗi vào catch thì vẫn phải trả ra lỗi
//            System.out.print(5/0);
//
//        } catch (Exception e){
////            System.out.println(e.getMessage());
//            ErrorResponseDTO errorResponseDTO = new ErrorResponseDTO();
//            errorResponseDTO.setError(e.getMessage());
//            List<String> details = new ArrayList<>();
//            details.add("Số nguyên làm sao chia cho số 0 được?");
//            errorResponseDTO.setDetail(details);
//            return errorResponseDTO;
//        }
////        System.out.print(5/0);
//        BuildingDTO result = new BuildingDTO();
//        result.setName(nameBuilding);
//        result.setNumberOfBasement(numberOfBasement);
//        result.setWard(ward);
////        return result;
//        return null;
//    }
    @PostMapping(value="/api/building/")
    public Object getBuilding(@RequestBody BuildingDTO building) throws FieldRequiredException {
//        try {
//            System.out.println(5/0);
//            valiDate(building);
////        } catch (FieldRequiredException e){
//        } catch (Exception e){
////            System.out.println(e.getMessage());
//            ErrorResponseDTO errorResponseDTO = new ErrorResponseDTO();
//            errorResponseDTO.setError(e.getMessage());
//            List<String> details = new ArrayList<>();
//            details.add("Check lại name hoặc numberofbasement đi bởi vì đang bị null đó !");
//            errorResponseDTO.setDetail(details);
//            return errorResponseDTO;
//        }
        System.out.println(5/0);
        valiDate(building);
        return null;
    }

    // Nếu kế thừa lớp RuntimeException thì không cần throw
//    public void valiDate(BuildingDTO buildingDTO)throws FieldRequiredException {
    public void valiDate(BuildingDTO buildingDTO) {
        if (buildingDTO.getName() == null || buildingDTO.getName().isEmpty() || buildingDTO.getNumberOfBasement() == null){
            throw new FieldRequiredException("Name or Numberofbasement is null");
        }
    }

//    @RequestMapping(value = "/api/building/", method = RequestMethod.POST)
//    public void getBuilding2(@RequestParam Map<String, String> params) {
//        System.out.println(params);
//    }
//    @RequestMapping(value = "/api/building/", method = RequestMethod.POST)

//    @PostMapping(value="/api/building/")
//    public BuildingDTO getBuilding2(@RequestBody BuildingDTO building) {
////        System.out.println("ok");
////        Sau Xu ly duoi DB
//
//        return building;
//    }

    @DeleteMapping(value="/api/building/{id}/{name}")
    public void deleteBuilding(@PathVariable Integer id, @PathVariable String name, @RequestParam(value="ward", required=false) String ward) {
        System.out.println("Đã xoá toà nhà có id là: "+ id + " rồi nhé!");
    }
}
