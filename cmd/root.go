package main

import (
	"fmt"
	"log"
	"os"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

type AppConfig struct {
	Port string
}

var config AppConfig

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "go-template",
	Short: "A brief description of your application",
	Long:  "",
	Run: func(cmd *cobra.Command, args []string) {
		// app code goes here...
		fmt.Printf("port set to %s", config.Port)
	},
}

// execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func execute() {
	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}

func init() {
	err := viper.BindPFlag("port", rootCmd.PersistentFlags().Lookup("port"))
	if err != nil {
		log.Fatal(err)
	}

	viper.AutomaticEnv()

	// PersistentFlags will be global for your application.
	rootCmd.PersistentFlags().StringVarP(&config.Port, "port", "p", "54321", "Set port (overrides environment variable)")

	// Cobra also supports local flags, which will only run
	// rootCmd.Flags().String("port", "50051", "defines the port number the gRPC server will run on")

	// Use Viper to set the value of the Port field based on the environment variable
	config.Port = viper.GetString("port")
}

func main() {
	execute()
}
