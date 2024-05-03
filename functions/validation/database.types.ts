export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      kali_levels: {
        Row: {
          additional_reward: boolean | null
          created_at: string
          id: number
          image_url: string | null
          level_name: string | null
          motivational_quote: string | null
          order: number | null
          reward: number | null
          steps_to_next_level: number | null
          steps_to_this_level: number | null
          updated_at: string | null
        }
        Insert: {
          additional_reward?: boolean | null
          created_at?: string
          id?: number
          image_url?: string | null
          level_name?: string | null
          motivational_quote?: string | null
          order?: number | null
          reward?: number | null
          steps_to_next_level?: number | null
          steps_to_this_level?: number | null
          updated_at?: string | null
        }
        Update: {
          additional_reward?: boolean | null
          created_at?: string
          id?: number
          image_url?: string | null
          level_name?: string | null
          motivational_quote?: string | null
          order?: number | null
          reward?: number | null
          steps_to_next_level?: number | null
          steps_to_this_level?: number | null
          updated_at?: string | null
        }
        Relationships: []
      }
      kali_subscription: {
        Row: {
          created_at: string
          id: number
          name: string | null
          updated_at: string | null
          weeklyPointsLimit: number | null
        }
        Insert: {
          created_at?: string
          id?: number
          name?: string | null
          updated_at?: string | null
          weeklyPointsLimit?: number | null
        }
        Update: {
          created_at?: string
          id?: number
          name?: string | null
          updated_at?: string | null
          weeklyPointsLimit?: number | null
        }
        Relationships: []
      }
      user_profiles: {
        Row: {
          bio: string | null
          birthdate: string | null
          created_at: string
          email: string | null
          first_name: string | null
          id: number
          last_name: string | null
          profile_image: string | null
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          bio?: string | null
          birthdate?: string | null
          created_at?: string
          email?: string | null
          first_name?: string | null
          id?: number
          last_name?: string | null
          profile_image?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          bio?: string | null
          birthdate?: string | null
          created_at?: string
          email?: string | null
          first_name?: string | null
          id?: number
          last_name?: string | null
          profile_image?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: []
      }
      user_settings: {
        Row: {
          created_at: string
          enable_notifications: boolean
          id: number
          step_tracking: boolean
          timezone: string | null
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string
          enable_notifications?: boolean
          id?: number
          step_tracking?: boolean
          timezone?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string
          enable_notifications?: boolean
          id?: number
          step_tracking?: boolean
          timezone?: string | null
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_settings_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      user_steps: {
        Row: {
          created_at: string
          date: string | null
          goal: number | null
          has_activity: boolean | null
          id: number
          steps: number | null
          updated_at: string | null
          user_id: string | null
        }
        Insert: {
          created_at?: string
          date?: string | null
          goal?: number | null
          has_activity?: boolean | null
          id?: number
          steps?: number | null
          updated_at?: string | null
          user_id?: string | null
        }
        Update: {
          created_at?: string
          date?: string | null
          goal?: number | null
          has_activity?: boolean | null
          id?: number
          steps?: number | null
          updated_at?: string | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_steps_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      user_streaks: {
        Row: {
          created_at: string
          current_streak: number | null
          id: number
          last_logged_date: string | null
          longest_streak: number | null
          updated_at: string | null
          weekly_streak: string | null
        }
        Insert: {
          created_at?: string
          current_streak?: number | null
          id?: number
          last_logged_date?: string | null
          longest_streak?: number | null
          updated_at?: string | null
          weekly_streak?: string | null
        }
        Update: {
          created_at?: string
          current_streak?: number | null
          id?: number
          last_logged_date?: string | null
          longest_streak?: number | null
          updated_at?: string | null
          weekly_streak?: string | null
        }
        Relationships: []
      }
      user_subscription: {
        Row: {
          created_at: string
          id: number
          kali_subscription_id: number | null
          user_id: string | null
        }
        Insert: {
          created_at?: string
          id?: number
          kali_subscription_id?: number | null
          user_id?: string | null
        }
        Update: {
          created_at?: string
          id?: number
          kali_subscription_id?: number | null
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "user_subscription_kali_subscription_id_fkey"
            columns: ["kali_subscription_id"]
            isOneToOne: false
            referencedRelation: "kali_subscription"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_subscription_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      user_transactions: {
        Row: {
          amount: number | null
          created_at: string
          description: string | null
          id: number
          user_id: string
        }
        Insert: {
          amount?: number | null
          created_at?: string
          description?: string | null
          id?: number
          user_id: string
        }
        Update: {
          amount?: number | null
          created_at?: string
          description?: string | null
          id?: number
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_transactions_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
      user_wallet: {
        Row: {
          created_at: string
          current_balance: number | null
          id: number
          next_daily_bonus: string | null
          next_ten_days_bonus: string | null
          total_earning: number | null
          updated_at: string | null
          user_id: string | null
          weekly_earnings: number | null
        }
        Insert: {
          created_at?: string
          current_balance?: number | null
          id?: number
          next_daily_bonus?: string | null
          next_ten_days_bonus?: string | null
          total_earning?: number | null
          updated_at?: string | null
          user_id?: string | null
          weekly_earnings?: number | null
        }
        Update: {
          created_at?: string
          current_balance?: number | null
          id?: number
          next_daily_bonus?: string | null
          next_ten_days_bonus?: string | null
          total_earning?: number | null
          updated_at?: string | null
          user_id?: string | null
          weekly_earnings?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "user_wallet_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "users"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type PublicSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never
