import { useQuery } from "@tanstack/react-query";
import axiosInstance from "../utils/axiosInstance";

export const useLikes = () => {
  return useQuery({
    queryKey: ["likes"],
    queryFn: async () => {
      const { data } = await axiosInstance.get("/likes-age-gender");
      return data;
    },
  });
};
