import { useQuery } from "@tanstack/react-query";
import axiosInstance from "../utils/axiosInstance";

export const useCPC = () => {
  return useQuery({
    queryKey: ["cpc"],
    queryFn: async () => {
      const { data } = await axiosInstance.get("/cpc-account");
      return data;
    },
  });
};
