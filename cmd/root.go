package main

import (
	"fmt"
	myservice "go-template/internal/my_service"
	"log"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var rootCmd = &cobra.Command{
	Use:   "go-template",
	Short: "A brief description of your application",
	Long:  "A longer description about your application",
	Run: func(cmd *cobra.Command, args []string) {

		service := &myservice.Service{
			Port: viper.GetString("port"),
		}

		fmt.Printf("port set to %s", service.Port)
	},
}

func init() {
	viper.AutomaticEnv()
	rootCmd.Flags().StringP("port", "p", "50051", "defines the port number the gRPC server will run on")
	err := viper.BindPFlag("port", rootCmd.Flags().Lookup("port"))
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	err := rootCmd.Execute()
	if err != nil {
		log.Fatal(err)
	}
}
